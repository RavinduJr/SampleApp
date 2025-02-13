//
//  CategoryCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    var categoryImage = UIImageView(image: UIImage(systemName: "sink"))
    var categoryName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        print("came here")
        fatalError()
    }
    
    func configUI(category: Category?) {
        categoryName.text = category?.categoryName
    }
    
    func setupUI() {
        contentView.backgroundColor = .green
        
        contentView.addSubview(categoryImage)
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.contentMode = .scaleAspectFit

        contentView.addSubview(categoryName)
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryName.textAlignment = .center
        
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
