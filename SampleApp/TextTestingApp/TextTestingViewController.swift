////
////  TextTestingViewController.swift
////  SampleApp
////
////  Created by enTrust Title on 2024-05-19.
////
//
//import UIKit
//
//class TextTestingViewController: UIViewController {
//
//    var safeArea: UILayoutGuide!
//    
//    let textField: UITextField = {
//       let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let label: UILabel = {
//        let label = UILabel()
//        label.text = "Hi"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let parentView: UIView = {
//       let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        
//        safeArea = view.safeAreaLayoutGuide
//        
//        view.addSubview(parentView)
//        NSLayoutConstraint.activate([
//            parentView.heightAnchor.constraint(equalToConstant: 100),
//            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
//            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
//        ])
//        
//        parentView.addSubview(textField)
//        NSLayoutConstraint.activate([
//            textField.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 10),
//            textField.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 10),
//        ])
//        textField.addSubview(label)
//    }
//}
