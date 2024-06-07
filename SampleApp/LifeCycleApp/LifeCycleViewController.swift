//
//  LifeCycleViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-03.
//

import UIKit

class LifeCycleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hiya", for: .normal)
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(comeon), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20)
        ])
        
        let popUpButton = UIButton(type: .system)
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        popUpButton.setTitle("Hello", for: .normal)
        
        view.addSubview(popUpButton)
        
        popUpButton.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            popUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            popUpButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20)
        ])
    }
    
    @objc func comeon() {
        let firstScreenVC = FirstScreenViewController()
        self.navigationController?.pushViewController(firstScreenVC, animated: true)
    }
    
    @objc func popUp() {
        let firstScreenVC = FirstScreenViewController()
        self.navigationController?.present(firstScreenVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        print("viewIsAppearing")
    }
}
