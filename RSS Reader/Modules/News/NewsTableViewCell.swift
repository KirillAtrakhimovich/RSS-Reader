//
//  NewsTableViewCell.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"

    private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var image: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        isUserInteractionEnabled = true
        selectionStyle = .none
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        setupTitleLabel()
        setupAuthorLabel()
        setupDateLabel()
        setupImage()
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setupAuthorLabel() {
        self.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { constraints in
            constraints.top.equalTo(titleLabel.snp.bottom).offset(10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
    
    private func setupDateLabel() {
        self.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { constraints in
            constraints.top.equalTo(titleLabel.snp.bottom).offset(10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
    
    private func setupImage() {
        self.addSubview(image)
        image.snp.makeConstraints { constraints in
            constraints.top.equalTo(titleLabel.snp.bottom).offset(10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
}
