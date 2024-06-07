//
//  EmailCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-29.
//

import UIKit

class EmailCollectionCell: UICollectionViewCell {
    static let identifier = "EmailCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
