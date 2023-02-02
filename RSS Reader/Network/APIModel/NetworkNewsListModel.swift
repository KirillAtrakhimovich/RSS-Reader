//
//  NetworkNewsListModel.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import Foundation

struct Articles: Decodable {
    let articles: [NewsItem]
}

struct NewsItem: Decodable {
    let source: Info
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct Info: Decodable {
    let id: String
    let name: String
}
