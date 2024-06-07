//
//  MultipleCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-29.
//

import UIKit

class MultipleCollectionViewCell: UICollectionViewCell {
    static let identifier = "MultipleCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
