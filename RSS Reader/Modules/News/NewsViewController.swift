//
//  HomeViewController.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit

final class NewsViewController: NiblessViewController {
    
    private var newsModel: Article?
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
                self.newsModel = newsItem.articles
            case .failure(let error):
               print(error)
            }
        }
        
    }
    
    
    
}
