//
//  HomeViewController.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit

final class NewsViewController: NiblessViewController {
    
    private var newsModel = [Article]()
    private let isolationQueue = DispatchQueue(label: "newsRequestQueue", attributes: .concurrent)
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
               self.successNewsRequest(newsItem)
            case .failure(let error):
               print(error)
            }
        }
        print(newsModel)
    }
    
    private func successNewsRequest(_ news: Articles) {
        self.isolationQueue.async(flags: .barrier) {
            let newsItems = self.convertNews(news)
            self.newsModel += newsItems
        }
    }
    
    private func convertNews(_ newsInfo: Articles) -> [Article] {
        var newsItems = [Article]()
        for item in newsInfo.articles {
            let model = Article(author: item.author, title: item.title, description: item.description, url: item.url, urlToImage: item.urlToImage, publishedAt: item.publishedAt, content: item.content)
            newsItems.append(model)
        }
        return newsItems
    }
    
}
