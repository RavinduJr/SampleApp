//
//  PrimaryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-17.
//

import UIKit

class NTPrimaryViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    let parentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    func setToolBar() {
        let sendMailView = SendMailBottomToolBar()
        parentView.addSubview(sendMailView)
        NSLayoutConstraint.activate([
        ])
    }
    
    override var inputAccessoryView: UIView?{
        let sendMailView = SendMailBottomToolBar()
        return sendMailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.safeAreaLayoutGuide
//        print(inputAccessoryView)
        view.backgroundColor = .white
        
//        self.becomeFirstResponder()
        
        
        
        self.title = "Primary"
        hideButton.addTarget(self, action: #selector(hide), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showF), for: .touchUpInside)
        
        view.addSubview(parentView)
        
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            parentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        
        parentView.addSubview(hideButton)
        NSLayoutConstraint.activate([
            hideButton.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 20),
            hideButton.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 20)
        ])
        
        parentView.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 20),
            showButton.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -20)
        ])
    }
}
