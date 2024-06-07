//
//  DatePickerViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-19.
//

import UIKit

class DatePickerViewController: UIViewController {

    var pickedDate: Date?
    var safeArea: UILayoutGuide!
    
    let parentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    let startDateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let endDateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    @objc func startDatePickerHandler(_ sender: UIDatePicker){
        print(sender.date)
        endDatePicker.minimumDate = sender.date
    }
    
    @objc func endDatePickerHandler(_ sender: UIDatePicker){
        print(sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        
        view.addSubview(parentStack)
        NSLayoutConstraint.activate([
            parentStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            parentStack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentStack.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ])
        
        parentStack.addArrangedSubview(startDateView)
        NSLayoutConstraint.activate([
            startDateView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        startDateView.addSubview(startDatePicker)
        NSLayoutConstraint.activate([
            startDatePicker.centerYAnchor.constraint(equalTo: startDateView.centerYAnchor),
            startDatePicker.centerXAnchor.constraint(equalTo: startDateView.centerXAnchor),
        ])
        
        startDatePicker.addTarget(self, action: #selector(startDatePickerHandler), for: .valueChanged)
        
        parentStack.addArrangedSubview(endDateView)
        NSLayoutConstraint.activate([
            endDateView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        endDateView.addSubview(endDatePicker)
        NSLayoutConstraint.activate([
            endDatePicker.centerYAnchor.constraint(equalTo: endDateView.centerYAnchor),
            endDatePicker.centerXAnchor.constraint(equalTo: endDateView.centerXAnchor),
        ])
        
        endDatePicker.addTarget(self, action: #selector(endDatePickerHandler), for: .valueChanged)
        
        
    }
}
