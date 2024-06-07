//
//  ToCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-21.
//

import UIKit

class ToCollectionViewCell: UICollectionViewCell {

    static let identifier = "ToCollectionViewCell"
    
    let labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI(){
        backgroundColor = .red
        contentView.addSubview(labelContainer)
        NSLayoutConstraint.activate([
            labelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            labelContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            labelContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        labelContainer.addSubview(typedLabel)
        NSLayoutConstraint.activate([
            typedLabel.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor),
            typedLabel.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor)
        ])
    }
    
}
