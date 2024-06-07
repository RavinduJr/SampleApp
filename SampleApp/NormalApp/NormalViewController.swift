//
//  NormalViewController.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-24.
//

import UIKit

enum CollectionType {
    case to
    case singleMail
    case multipleMails
}

class NormalViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    var collectionArray: [CollectionType]!
    
    let parentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        return stack
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    let firstChildView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    let firstNestedChildView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    let customButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "sink"), for: .normal)
        button.setTitle("Button", for: .normal)
        
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ToCollectionViewCell.self, forCellWithReuseIdentifier: ToCollectionViewCell.identifier)
        collectionView.register(EmailCollectionCell.self, forCellWithReuseIdentifier: EmailCollectionCell.identifier)
        collectionView.register(MultipleCollectionViewCell.self,
                                forCellWithReuseIdentifier: MultipleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        safeArea = view.safeAreaLayoutGuide
        collectionArray = [.to, .multipleMails]
        
        view.addSubview(parentView)
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            parentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            parentView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            parentView.leftAnchor.constraint(equalTo: safeArea.leftAnchor)
        ])
        
        parentView.addSubview(firstView)
        NSLayoutConstraint.activate([
            firstView.heightAnchor.constraint(equalToConstant: 75),
            firstView.leftAnchor.constraint(equalTo: parentView.leftAnchor),
            firstView.rightAnchor.constraint(equalTo: parentView.rightAnchor)
        ])
        
        firstView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: firstView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: firstView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: firstView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor)
        ])
    }
}

extension NormalViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension NormalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToCollectionViewCell.identifier, 
                                                                for: indexPath) as? ToCollectionViewCell else {
                fatalError("Couldnt find ToCollectionViewCell")
            }
            return cell
        }
        
        if collectionArray.count == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmailCollectionCell.identifier, 
                                                                for: indexPath) as? EmailCollectionCell else {
                fatalError("Couldnt find EmailCollectionCell")
            }
            return cell
        }
        
        if collectionArray.count > 2 {
            if indexPath.row <= 1 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleCollectionViewCell.identifier, for: indexPath) as? MultipleCollectionViewCell else {
                    fatalError("Couldnt find MultipleCollectionViewCell")
                }
                return cell
            }
        }
        
        print("Came here")
        return UICollectionViewCell(frame: .zero)
        // to item
        // if selected one item show that person
        // else multiple show 1 person name and +(number of people) others
    }
    
    
}

extension NormalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
