//
//  TreeViewController.swift
//  SampleApp
//
//  Created by ravindu jayasekara on 2025-02-06.
//

import UIKit

struct Node<Value> {
    var value: Value
    var children: [Node]
    
    init(value: Value) {
        self.value = value
        self.children = []
    }
    
    mutating func add(child: Node) {
        self.children.append(child)
    }
}

class TreeViewController: UIViewController {
    
    var treeStructure = [Node]()
    
    private let treeTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(TreeTableViewCell.self, forCellReuseIdentifier: TreeTableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        treeTableView.dataSource = self
        treeTableView.delegate = self
        view.addSubview(treeTableView)
        
        NSLayoutConstraint.activate([
            treeTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            treeTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            treeTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            treeTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var malith = Node(value: "Malith")
        let dulana = Node(value: "Dulana")
        malith.add(child: dulana)
        
        var jayasekara = Node(value: "Jayasekara")
        var pasindu = Node(value: "Pasindu")
        var ravindu = Node(value: "Ravindu")
        jayasekara.add(child: malith)
        jayasekara.add(child: pasindu)
        jayasekara.add(child: ravindu)
        
        treeStructure = [jayasekara]
        
        setupUI()
    }
}

extension TreeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TreeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treeStructure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TreeTableViewCell.identifier, for: indexPath) as? TreeTableViewCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
