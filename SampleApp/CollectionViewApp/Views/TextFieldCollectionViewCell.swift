//
//  TextFieldCollectionViewCell.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-21.
//

import UIKit

protocol ItemExpander {
    func addItemsToList(body: String)
}

class TextFieldCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TextFieldCollectionViewCell"
    
    var delegate: ItemExpander?
    
    let textContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type Email"
        textField.backgroundColor = .cyan
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField.delegate = self
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI(){
        contentView.addSubview(textContainer)
        NSLayoutConstraint.activate([
            textContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            textContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            textContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textContainer.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        textContainer.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalTo: textContainer.heightAnchor, multiplier: 1),
            emailTextField.leftAnchor.constraint(equalTo: textContainer.leftAnchor, constant: 5),
            emailTextField.rightAnchor.constraint(equalTo: textContainer.rightAnchor, constant: -5)
        ])
    }
    

}


extension TextFieldCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.addItemsToList(body: textField.text ?? "")
        return true
    }
}
