//
//  CategoryCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    var categoryImage = UIImageView()
    var categoryName = UILabel()
    
    required init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configUI(category: Category?) {
        categoryName.text = category?.categoryName
        categoryImage.image = category?.categoryImage
    }
    
    func setupUI() {
        contentView.backgroundColor = .green
        
        contentView.addSubview(categoryImage)

        contentView.addSubview(categoryName)
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 2/3),
            
            categoryName.topAnchor.constraint(equalTo: categoryImage.bottomAnchor),
            categoryName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
