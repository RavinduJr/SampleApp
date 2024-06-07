//
//  EmailVCViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-17.
//

import UIKit

enum TextFieldEditing: Int {
    case to = 1
    case subject = 2
}

class EmailViewController: UIViewController {
    
//    private var viewModel: FilterDocumentsViewModel!
    let names: Array<String> = List.names()
    var safeArea: UILayoutGuide!
    
    let zTokenType: ZSTokenWordView = {
       let tokenView = ZSTokenWordView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        tokenView.promptText = "Top: "
        tokenView.placeholder = "Type to search"
        tokenView.descriptionText = "Languages"
        tokenView.maxTokenLimit = -1
        tokenView.searchResultHeight = 100
        tokenView.minimumCharactersToSearch = 0 // Show all results without without typing anything
        tokenView.style = .squared
        tokenView.returnKeyType(type: .done)
//        tokenView.translatesAutoresizingMaskIntoConstraints = false
        tokenView.backgroundColor = .red
        return tokenView
    }()
    
    let mainView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parentStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    let headerSeperator:UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ZSGrayBorder12")
         return view
    }()
    
    let toSubjectSeperator:UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ZSGrayBorder12")
         return view
    }()
    
    let subjectMessageSeperator:UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ZSGrayBorder12")
         return view
    }()
    
    let messageBottomSeperator:UIView = {
        let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ZSGrayBorder12")
         return view
    }()
    
    let toStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let subjectStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    let toLabel: UILabel = {
        let label = UILabel()
        label.text = "To:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subjectLabel: UILabel = {
        let label = UILabel()
        label.text = "Subject:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subjectLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let toTextField: UITextField = {
        let textField = UITextField()
        textField.tag = TextFieldEditing.to.rawValue
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Value"
        return textField
    }()
    
    let toTextView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subjectTextField: UITextField = {
        let textField = UITextField()
        textField.tag = TextFieldEditing.subject.rawValue
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Value"
        return textField
    }()
    
    let subjectTextView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageBody: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.text = "Enter your message here"
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let messageBodyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let copyStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.distribution = .fill
         return stackView
    }()
    
    let copyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Send me a copy"
        return label
    }()
    
    let copyLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let copySwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.preferredStyle = .sliding
        return switchButton
    }()
    
    let copySwitchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    @objc func sendHandler(){
        
    }
    
    @objc func cancelHandler(){
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        
        safeArea = view.safeAreaLayoutGuide
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        toTextField.delegate = self
//        subjectTextField.delegate = self
        messageBody.delegate = self
        
        self.title = "Send Email"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .plain, target: self,
                                                                 action: #selector(sendHandler))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self,
                                                                action: #selector(cancelHandler))
        
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ])
        
        mainView.addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: mainView.topAnchor),
            parentStackView.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            parentStackView.rightAnchor.constraint(equalTo: mainView.rightAnchor)
        ])
        
        parentStackView.addArrangedSubview(headerSeperator)
        NSLayoutConstraint.activate([
            headerSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        //to implementation
        parentStackView.addArrangedSubview(zTokenType)
        zTokenType.delegate = self
        
        NSLayoutConstraint.activate([
            toStackView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        toStackView.addArrangedSubview(toLabelView)
        NSLayoutConstraint.activate([
            toLabelView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        toLabelView.addSubview(toLabel)
        NSLayoutConstraint.activate([
            toLabel.centerYAnchor.constraint(equalTo: toLabelView.centerYAnchor),
            toLabel.rightAnchor.constraint(equalTo: toLabelView.rightAnchor, constant: -16)
        ])
        
        toStackView.addArrangedSubview(toTextView)
        
        toTextView.addSubview(toTextField)
        NSLayoutConstraint.activate([
            toTextField.leftAnchor.constraint(equalTo: toTextView.leftAnchor, constant: 16),
            toTextField.centerYAnchor.constraint(equalTo: toTextView.centerYAnchor),
            toTextField.rightAnchor.constraint(equalTo: toTextView.rightAnchor, constant: -16)
        ])
        
        parentStackView.addArrangedSubview(toSubjectSeperator)
        NSLayoutConstraint.activate([
            toSubjectSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        //subject implementation
        
        parentStackView.addArrangedSubview(subjectStackView)
        
        NSLayoutConstraint.activate([
            subjectStackView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        subjectStackView.addArrangedSubview(subjectLabelView)
        NSLayoutConstraint.activate([
            subjectLabelView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        subjectLabelView.addSubview(subjectLabel)
        NSLayoutConstraint.activate([
            subjectLabel.centerYAnchor.constraint(equalTo: subjectLabelView.centerYAnchor),
            subjectLabel.rightAnchor.constraint(equalTo: subjectLabelView.rightAnchor, constant: -16)
        ])
        
        subjectStackView.addArrangedSubview(subjectTextView)
        
        subjectTextView.addSubview(subjectTextField)
        NSLayoutConstraint.activate([
            subjectTextField.leftAnchor.constraint(equalTo: subjectTextView.leftAnchor, constant: 16),
            subjectTextField.centerYAnchor.constraint(equalTo: subjectTextView.centerYAnchor),
            subjectTextField.rightAnchor.constraint(equalTo: subjectTextView.rightAnchor, constant: -16)
        ])
        
        parentStackView.addArrangedSubview(subjectMessageSeperator)
        NSLayoutConstraint.activate([
            subjectMessageSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // message body implementation
        
        parentStackView.addArrangedSubview(messageBodyView)
        NSLayoutConstraint.activate([
            messageBodyView.leftAnchor.constraint(equalTo: parentStackView.leftAnchor),
            messageBodyView.rightAnchor.constraint(equalTo: parentStackView.rightAnchor),
            messageBodyView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        messageBodyView.addSubview(messageBody)
        NSLayoutConstraint.activate([
            messageBody.topAnchor.constraint(equalTo: messageBodyView.topAnchor, constant: 10),
            messageBody.leftAnchor.constraint(equalTo: messageBodyView.leftAnchor, constant: 16),
            messageBody.rightAnchor.constraint(equalTo: messageBodyView.rightAnchor, constant: -16),
            messageBody.bottomAnchor.constraint(equalTo: messageBodyView.bottomAnchor, constant: -10),
        ])
        
        parentStackView.addArrangedSubview(messageBottomSeperator)
        NSLayoutConstraint.activate([
            messageBottomSeperator.heightAnchor.constraint(equalToConstant: 1),
//            messageBottomSeperator.bottomAnchor.constraint(equalTo: parentStackView.bottomAnchor),
        ])
        
        parentStackView.addArrangedSubview(copyStackView)
        NSLayoutConstraint.activate([
            copyStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        copyStackView.addArrangedSubview(copyLabelView)
        copyLabelView.addSubview(copyLabel)
        NSLayoutConstraint.activate([
            copyLabel.centerYAnchor.constraint(equalTo: copyLabelView.centerYAnchor),
            copyLabel.leftAnchor.constraint(equalTo: copyLabelView.leftAnchor, constant: 16)
        ])
        
        copyStackView.addArrangedSubview(copySwitchView)
        NSLayoutConstraint.activate([
            copySwitchView.widthAnchor.constraint(equalToConstant: 100)
        ])
        copySwitchView.addSubview(copySwitch)
        NSLayoutConstraint.activate([
            copySwitch.centerYAnchor.constraint(equalTo: copySwitchView.centerYAnchor),
            copySwitch.centerXAnchor.constraint(equalTo: copySwitchView.centerXAnchor)
        ])
    }
}

extension EmailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter your message here"
            textView.textColor = UIColor.lightGray
        }
    }
}

extension EmailViewController: ZSTokenWordViewDelegate {
    func tokenView(_ tokenView: ZSTokenWordView, performSearchWithString string: String, completion: ((_ results: Array<AnyObject>) -> Void)?) {
        if (string.isEmpty){
            completion!(names as Array<AnyObject>)
            return
        }
        
        var data: Array<String> = []
        for value: String in names {
            if value.lowercased().range(of: string.lowercased()) != nil {
                data.append(value)
            }
        }
        completion!(data as Array<AnyObject>)
    }
    
    func tokenView(_ tokenView: ZSTokenWordView, displayTitleForObject object: AnyObject) -> String {
        return object as! String
    }
    
    func tokenView(_ tokenView: ZSTokenWordView, shouldAddToken token: ZSToken) -> Bool {
        
        // Restrict adding token based on token text
        if token.title == "f" {
            return false
        }
        
        // If user input something, it can be checked
//        print(tokenView.text)
        
        return true
    }
}
