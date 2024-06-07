//
//  BottomToolBar.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-17.
//

import UIKit



class InboxBottomToolBar: UIToolbar {
    
    var addToLabel: UIBarButtonItem!
    var sendEmail: UIBarButtonItem!
        
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addToLabelHandler(){
        
    }
    
    @objc func sendEmailHandler(){
        
    }
    
    func setUI(){
        self.barStyle = UIBarStyle.default
        self.isTranslucent = false
        self.tintColor = .darkGray
        self.barTintColor = UIColor(named: "ZSGray6")
        self.sizeToFit()
        self.isUserInteractionEnabled = true
        
        addToLabel = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self,
                                     action: #selector(addToLabelHandler))
        sendEmail = UIBarButtonItem(image: UIImage(systemName: "sink"), style: .plain, target: self,
                                     action: #selector(sendEmailHandler))
        
        self.items = [addToLabel, sendEmail]
    }
}
