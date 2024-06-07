//
//  CollectionViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-20.
//

import UIKit

enum CellType {
    case to
    case textField
    case emailLabel
}

class CollectionViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    var itemArray: [CellType] = [.to, .textField]
    var bodyString: [String] = ["start", "end"]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TextFieldCollectionViewCell.self,
                                forCellWithReuseIdentifier: TextFieldCollectionViewCell.identifier)
        collectionView.register(ToCollectionViewCell.self,
                                forCellWithReuseIdentifier: ToCollectionViewCell.identifier)
        collectionView.register(EmailCollectionViewCell.self,
                                forCellWithReuseIdentifier: EmailCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = itemArray[indexPath.row]
        switch cellType {
        case .to:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToCollectionViewCell.identifier,
                                                          for: indexPath) as! ToCollectionViewCell
            return cell
        case .textField:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldCollectionViewCell.identifier,
                                                          for: indexPath) as! TextFieldCollectionViewCell
            cell.delegate = self
            return cell
        case .emailLabel:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmailCollectionViewCell.identifier,
                                                          for: indexPath) as! EmailCollectionViewCell
            let index = indexPath.row
            print(index)
            print(bodyString[index])
            cell.typedLabel.text = bodyString[index]
            return cell
        }
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = itemArray[indexPath.row]
            switch cellType {
            case .to:
                return CGSize(width: 50, height: 50)
            case .textField:
                return CGSize(width: 100, height: 50)
            case .emailLabel:
                return CGSize(width: 50, height: 50)
            }
    }
}

extension CollectionViewController: ItemExpander {
    func addItemsToList(body: String) {
        itemArray.insert(.emailLabel, at: itemArray.count - 1)
        bodyString.insert(body, at: bodyString.count - 1)
        collectionView.reloadData()
    }
}
