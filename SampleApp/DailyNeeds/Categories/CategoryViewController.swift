//
//  CategoryViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var categoryCollection: UICollectionView!
    var safeArea: UILayoutGuide!
    var categories: [Category] = [
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu"),
        Category(categoryId: "1", categoryName: "Ravindu")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @objc func addCategoryPopUpHandler() {
        let addCategoryViewController = AddCategoryViewController()
        self.navigationController?.present(addCategoryViewController, animated: true)
    }
    
    private func setupUI() {
        safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.navigationItem.title = Strings.Category.categoryTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self,
                                                                 action: #selector(addCategoryPopUpHandler))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        categoryCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.backgroundColor = .red
        categoryCollection.translatesAutoresizingMaskIntoConstraints = false
        categoryCollection.register(CategoryCollectionViewCell.self, 
                                    forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        view.addSubview(categoryCollection)
        
        NSLayoutConstraint.activate([
            //  Collection constraints set
            categoryCollection.topAnchor.constraint(equalTo: safeArea.topAnchor),
            categoryCollection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            categoryCollection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            categoryCollection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionViewCell.identifier,
            for: indexPath
        ) as? CategoryCollectionViewCell else {fatalError("The dequeued cell is not an instance of ZVaultContactCell.")}
        categoryCell.configUI(category: categories[indexPath.row])
        return categoryCell
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
