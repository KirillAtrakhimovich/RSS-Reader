import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case emptyData
    case parsingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Was sending invalid URL."
        case .emptyData:
            return "No data here."
        case .parsingError:
            return "Met parsing error."
        }
    }
}

final class NetworkManager {

    let stringURL = Constants.url
    
    func getNewsItem(completion: @escaping (Result<Articles, Error>) -> Void) {
        guard let url = URL(string: stringURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.emptyData))
                return
            }
           
            if let mainObject = try? JSONDecoder().decode(Articles.self, from: data) {
                completion(.success(mainObject))
            } else {
                completion(.failure(NetworkError.parsingError))
            }
        }.resume()
    }
}
    


extension NetworkManager {
    struct Constants {
        static let url = "https://newsapi.org/v2/everything?q=apple&from=2023-01-31&to=2023-01-31&sortBy=popularity&apiKey=9cc8c2e0dfde4fd0b1b133a345ef5cc0"
    }
}

