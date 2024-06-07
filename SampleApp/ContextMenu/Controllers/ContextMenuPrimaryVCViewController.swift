//
//  ContextMenuPrimaryVCViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-13.
//

import UIKit

class ContextMenuPrimaryVCViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    let parentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sortByStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let sortByIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "navSortByIcon")
        return imageView
    }()
    
    let sortByLabel: UILabel = {
        let label = UILabel()
        label.text = "Sort By"
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        view.addSubview(parentView)
        
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            parentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            parentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        sortByStackView.addArrangedSubview(sortByIcon)
        sortByStackView.addArrangedSubview(sortByLabel)
        
        parentView.addSubview(sortByStackView)
    }
    
}
