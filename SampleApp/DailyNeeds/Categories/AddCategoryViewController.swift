//
//  AddCategoryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import UIKit

class AddCategoryViewController: UIViewController {

    var categoryImage = UIImageView()
    var categoryName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
    }
}

extension AddCategoryViewController: UITextFieldDelegate {
    
}
