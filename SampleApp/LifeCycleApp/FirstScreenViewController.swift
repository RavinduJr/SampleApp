//
//  FirstScreenViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-03.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.backgroundColor = .white
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
