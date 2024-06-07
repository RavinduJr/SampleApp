//
//  MenuViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-19.
//

import UIKit

class MenuViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    let filterByOption: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ravindu", for: .normal)
        return button
    }()
    
    let filterByOptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    func createMenu() -> UIMenu {
         // Create UIActions
         let action1 = UIAction(title: "Envelope Name", image: UIImage(systemName: "1.circle")) { action in
             print("Action 1 selected")
         }
         
         let action2 = UIAction(title: "Creator Name", image: UIImage(systemName: "2.circle")) { action in
             print("Action 2 selected")
         }
         
         let action3 = UIAction(title: "Action 3", image: UIImage(systemName: "3.circle")) { action in
             print("Action 3 selected")
         }
         
         // Create the UIMenu with the actions
         return UIMenu(title: "", children: [action1, action2, action3])
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        
        filterByOption.menu = createMenu()
        filterByOption.showsMenuAsPrimaryAction = true
        
        view.addSubview(filterByOptionView)
        NSLayoutConstraint.activate([
            filterByOptionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            filterByOptionView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 16),
            filterByOptionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        filterByOptionView.addSubview(filterByOption)
        NSLayoutConstraint.activate([
            filterByOption.leftAnchor.constraint(equalTo: filterByOptionView.leftAnchor, constant: 16),
            filterByOption.rightAnchor.constraint(equalTo: filterByOptionView.rightAnchor, constant: -16)
        ])
    }
}
