//
//  MenuViewController.swift
//  SampleApp
//
//  Created by ravindu jayasekara on 2025-02-06.
//

import UIKit

class MenuViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    
    func menu() {
        let interaction = UIContextMenuInteraction(delegate: self)
        button.addInteraction(interaction)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        menu()
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
}

extension MenuViewController: UIContextMenuInteractionDelegate {
    
    @objc func newDocument() {
        
    }
    
    @objc func openDocument() {
        
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil,
                                          actionProvider: {
                suggestedActions in
            let inspectAction =
                UIAction(title: NSLocalizedString("InspectTitle", comment: ""),
                         image: UIImage(systemName: "arrow.up.square")) { action in

                }
                
            let duplicateAction =
                UIAction(title: NSLocalizedString("DuplicateTitle", comment: ""),
                         image: UIImage(systemName: "plus.square.on.square")) { action in

                }
                
            let deleteAction =
                UIAction(title: NSLocalizedString("DeleteTitle", comment: ""),
                         image: UIImage(systemName: "trash"),
                         attributes: .destructive) { action in
                }
                
            let newDocument = UIKeyCommand(title: "New",
                                           action: #selector(self.newDocument),
                                           input: "n",
                                           modifierFlags: .command)


            let openDocument = UIKeyCommand(title: "Open...",
                                            action: #selector(self.openDocument),
                                            input: "o",
                                            modifierFlags: .command)
            
            let m1 = UIMenu(title: "", options: .displayInline, children: [newDocument, openDocument])
            let m2 = UIMenu(title: "", options: .displayInline, children: [inspectAction, duplicateAction, deleteAction])
            
            return UIMenu(title: "", children: [m1, m2])
        })
    }
}
