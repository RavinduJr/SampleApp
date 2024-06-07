//
//  ToViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-21.
//

import UIKit

class ToViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    let names: Array<String> = List.names()
    
    let parentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        view.addSubview(parentView)
        
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            parentView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        parentView.addSubview(zTokenType)
        zTokenType.delegate = self
    }
}

extension ToViewController: ZSTokenWordViewDelegate {
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
