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
    var categoryCollectionWidth = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @objc func addCategoryPopUpHandler() {
        let addCategoryVC = AddCategoryViewController()
        addCategoryVC.delegate = self
        let addCategoryViewController = UINavigationController(rootViewController: addCategoryVC)
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
        let itemListVC = ItemListViewController()
        self.navigationController?.pushViewController(itemListVC, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryCollectionWidth = categoryCollection.frame.width
        return categories.count
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
        let widthOfOneView = (categoryCollectionWidth / 4) - 5
        
        return CGSize(width: widthOfOneView, height: 100)
    }
}

//MARK: - Orientation handling in swift
extension CategoryViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            
        }) { _ in
            
            self.categoryCollectionWidth = size.width
        }
    }
}

extension CategoryViewController: AddCategoryViewControllerDelegate {
    func addCategoryHandler(category: Category) {
        categories.append(category)
        categoryCollection.reloadData()
    }
}
