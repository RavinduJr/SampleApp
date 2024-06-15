//
//  ShopItemTableViewCell.swift
//  SampleApp
//
//  Created by ravindu jayasekara on 2024-06-14.
//

import UIKit

class ShopItemTableViewCell: UITableViewCell {
    static let identifier = "ShopItemTableViewCell"
    
    var shopItemLabel = UILabel()
    
    private func configUI(shopItem: ShopItem) {
        shopItemLabel.text = shopItem.itemName
    }
    
    private func setupUI() {
        addSubview(shopItemLabel)
        shopItemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shopItemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shopItemLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            shopItemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shopItemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
