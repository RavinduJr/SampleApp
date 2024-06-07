//
//  CollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-21.
//

import UIKit

class EmailCollectionViewCell: UICollectionViewCell {

    static let identifier = "EmailCollectionViewCell"
    
    let labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typedLabel: UILabel = {
        let label = UILabel()
        label.text = "Ravindu@gmail.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init(title: String){
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI(){
        contentView.addSubview(labelContainer)
        NSLayoutConstraint.activate([
            labelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            labelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            labelContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        
        labelContainer.addSubview(typedLabel)
        
        NSLayoutConstraint.activate([
            typedLabel.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor),
            typedLabel.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor)
        ])
    }
    
}
