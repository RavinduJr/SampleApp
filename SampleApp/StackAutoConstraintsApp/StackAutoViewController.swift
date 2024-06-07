//
//  StackAutoViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-26.
//

import UIKit

class StackAutoViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    let screenSize: CGRect = UIScreen.main.bounds
    
    let parentView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(parentView)
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ])
        
        // Create a UIStackView
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = true
        
        // Create two sample views to add to the stack view
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.translatesAutoresizingMaskIntoConstraints = true
        view1.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        let view2 = UIView()
        view2.backgroundColor = .green
        view2.translatesAutoresizingMaskIntoConstraints = true
        view2.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        
        // Add the sample views to the stack view
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        
        // Set the frame of the stack view
        stackView.frame = CGRect(x: 20, y: 50, width: 280, height: 50)
        
        // Add the stack view to the main view
        parentView.addSubview(stackView)
        
        
    }
}
