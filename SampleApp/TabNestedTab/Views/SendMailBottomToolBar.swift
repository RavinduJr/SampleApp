//
//  SendMailBottomToolBar.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-17.
//

import UIKit

class SendMailBottomToolBar: UIView {
    
    let parentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sendEmailButton: UIButton = {
       let button = UIButton()
        button.setTitle("Send Email", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addToLabelButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "sink"), for: .normal)
        button.setTitle("Send Email", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    init() {
//        super.init(frame: .zero)
//        setUI()
//    }
    
    func setUI(){
        addSubview(parentView)
        NSLayoutConstraint.activate([
            parentView.heightAnchor.constraint(equalToConstant: 100),
            parentView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        parentView.addSubview(sendEmailButton)
        NSLayoutConstraint.activate([
            sendEmailButton.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 16),
            sendEmailButton.centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
        parentView.addSubview(addToLabelButton)
        NSLayoutConstraint.activate([
            addToLabelButton.leftAnchor.constraint(equalTo: parentView.rightAnchor, constant: -16),
            addToLabelButton.centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
    }
    
}
