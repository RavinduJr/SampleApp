//
//  SecondaryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-17.
//

import UIKit

class NTSecondaryViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    let hideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func hide(){
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func showF(){
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        
        self.title = "Secondary"
        hideButton.addTarget(self, action: #selector(hide), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showF), for: .touchUpInside)
        view.addSubview(hideButton)
        view.addSubview(showButton)
        
        NSLayoutConstraint.activate([
            hideButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            hideButton.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            showButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20)
        ])
        
    }
}
