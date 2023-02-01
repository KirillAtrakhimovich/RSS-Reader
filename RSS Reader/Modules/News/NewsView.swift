//
//  HomeView.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit
import SnapKit

final class NewsView: UIView {
    
    private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "News"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        return titleLabel
    }()
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    func setup() {
        setupTitleLabel()
        setupTableView()
        backgroundColor = .black
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { constraints in
            constraints.top.equalTo(titleLabel.snp.bottom).offset(10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
}
