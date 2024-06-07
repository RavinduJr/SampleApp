//
//  ExpandTextFieldViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-21.
//

import UIKit

class ExpandTextFieldViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    let parentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textView: SubjectTextView = {
       let text = SubjectTextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(parentView)
        NSLayoutConstraint.activate([
            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            parentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        parentView.addSubview(textView)
        textView.backgroundColor = .red
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            textView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            textView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
