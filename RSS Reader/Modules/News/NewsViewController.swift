//
//  HomeViewController.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit

final class NewsViewController: NiblessViewController {
    
    private var newsModel = [Article]()
    let networkManager: NetworkManager
    let newsView = NewsView()
    
    override func loadView() {
        view = newsView
    }
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsView.setup()
       
        networkManager.getNewsItem { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let newsItem):
                self.newsModel = 
            case .failure(let error):
               print(error)
            }
        }
    }
    
    private func convertNews(_ newsInfo: Articles) -> [Article] {
        var newsItems = [Article]()
        for item in newsInfo.articles {
//            let name = namesIds.filter { $0.1 == newsInfo.appid }.first.map { $0.0 } ?? "1"
            let model = Article(author: item.author, title: item.title, description: item.description, url: item.url, urlToImage: item.urlToImage, publishedAt: item.publishedAt, content: item.content)
            newsItems.append(model)
        }
        return newsItems
    }
    
}
