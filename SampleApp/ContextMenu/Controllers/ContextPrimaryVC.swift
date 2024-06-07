//
//  PrimaryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-15.
//

import UIKit

class ContextPrimaryVC: UIViewController {

    var safeArea: UILayoutGuide!
    
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let parentStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .white
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let fChild: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sChild: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fLabel:UILabel = {
        let label = UILabel()
        label.text = "Ravi"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sLabel:UILabel = {
        let label = UILabel()
        label.text = "Jayasekara"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let initialStartDateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    let initialStartDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let endStartDateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let endStartDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let labelView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "To"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(firstView)
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            firstView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            firstView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ])
        
        firstView.addSubview(parentStack)
        
        NSLayoutConstraint.activate([
            parentStack.topAnchor.constraint(equalTo: firstView.topAnchor),
            parentStack.leftAnchor.constraint(equalTo: firstView.leftAnchor),
            parentStack.rightAnchor.constraint(equalTo: firstView.rightAnchor),
            parentStack.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        parentStack.addArrangedSubview(initialStartDateView)
        NSLayoutConstraint.activate([
            initialStartDateView.widthAnchor.constraint(equalTo: parentStack.widthAnchor, multiplier: 2/5)
        ])
        initialStartDateView.addSubview(initialStartDate)
        NSLayoutConstraint.activate([
            initialStartDate.centerYAnchor.constraint(equalTo: initialStartDateView.centerYAnchor),
            initialStartDate.leftAnchor.constraint(equalTo: initialStartDateView.leftAnchor, constant: 16),
            initialStartDate.rightAnchor.constraint(equalTo: initialStartDateView.rightAnchor, constant: -16),
            initialStartDate.centerXAnchor.constraint(equalTo: initialStartDateView.centerXAnchor)
        ])
        
        parentStack.addArrangedSubview(labelView)
        labelView.addSubview(label)
        NSLayoutConstraint.activate([
            labelView.widthAnchor.constraint(equalTo: parentStack.widthAnchor, multiplier: 1/5)
        ])
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            label.leftAnchor.constraint(equalTo: labelView.leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: labelView.rightAnchor, constant: -16)
        ])
        
        parentStack.addArrangedSubview(endStartDateView)
        NSLayoutConstraint.activate([
            endStartDateView.widthAnchor.constraint(equalTo: parentStack.widthAnchor, multiplier: 2/5)
        ])
        endStartDateView.addSubview(endStartDate)
        NSLayoutConstraint.activate([
            endStartDate.centerYAnchor.constraint(equalTo: endStartDateView.centerYAnchor),
            endStartDate.leftAnchor.constraint(equalTo: endStartDateView.leftAnchor, constant: 16),
            endStartDate.rightAnchor.constraint(equalTo: endStartDateView.rightAnchor, constant: -16),
            endStartDate.centerXAnchor.constraint(equalTo: endStartDateView.centerXAnchor)
        ])

    }
}
