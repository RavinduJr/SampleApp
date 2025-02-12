//
//  AddCategoryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import UIKit

protocol AddCategoryViewControllerDelegate {
    func addCategoryHandler(category: Category)
}

class AddCategoryViewController: UIViewController {
    
    let categoryImage: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let categoryNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Enter Value"
        textfield.font = .systemFont(ofSize: 16, weight: .thin)
        return textfield
    }()
    
    let addCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category Name"
        label.font = .systemFont(ofSize: 18, weight: .thin)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray50")
        return view
    }()
    
    var delegate: AddCategoryViewControllerDelegate?
    
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func cancelHandler() {
        self.dismiss(animated: true)
    }
    
    @objc private func addHandler() {
        categoryNameTextField.resignFirstResponder()
        guard let categoryNameValue = categoryNameTextField.text else { return }
        let category = Category(categoryId: "2", categoryName: categoryNameValue)
        delegate?.addCategoryHandler(category: category)
        self.dismiss(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        
        self.navigationItem.title = "Add Category"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelHandler))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addHandler))
        
        view.addSubview(containerView)
        
        containerView.addSubview(addCategoryLabel)
        
        containerView.addSubview(categoryNameTextField)
        categoryNameTextField.delegate = self
        
        containerView.addSubview(addImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            addCategoryLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            addCategoryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            addCategoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            categoryNameTextField.topAnchor.constraint(equalTo: addCategoryLabel.bottomAnchor, constant: 8),
            categoryNameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            categoryNameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            addImageView.heightAnchor.constraint(equalToConstant: 50),
            addImageView.widthAnchor.constraint(equalToConstant: 50),
            addImageView.topAnchor.constraint(equalTo: categoryNameTextField.bottomAnchor, constant: 16)
        ])
    }
}

extension AddCategoryViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let categoryNameValue = textField.text else { return }
        if categoryNameValue.isEmpty {
            let alert = UIAlertController(title: "Oops", message: "Category name is empty", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Continue", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }
}
