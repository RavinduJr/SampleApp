//
//  ItemListViewController.swift
//  SampleApp
//
//  Created by ravindu jayasekara on 2024-06-14.
//

import UIKit

class ItemListViewController: UIViewController {
    
    var itemListTableView = UITableView()
    var itemsList: [ShopItem] = [ShopItem]()
    var safeArea: UILayoutGuide!
    
    private func setupUI() {
        view.addSubview(itemListTableView)
        itemListTableView.translatesAutoresizingMaskIntoConstraints = false
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        itemListTableView.register(ShopItemTableViewCell.self, forCellReuseIdentifier: ShopItemTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            itemListTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            itemListTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            itemListTableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            itemListTableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        self.navigationItem.title = "Shopping Items"
        setupUI()
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopItemTableViewCell.identifier, for: indexPath) as? ShopItemTableViewCell else {fatalError()}
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A","B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
