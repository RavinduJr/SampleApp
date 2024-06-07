//
//  CategoryViewModel.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-06-06.
//

import Foundation

protocol CategoryViewModelProtocol {
    var categories: [Category] {get set}
}

class CategoryViewModel: CategoryViewModelProtocol {
    var categories: [Category] = []
    
    func addCategories(category: Category) {
        var availableCategories = getCategories()
        availableCategories.append(category)
        setCategories(categories: availableCategories)
    }
    
    func removeCategories(categoryId: String) {
        let filteredCategories = categories.filter { $0.categoryId != categoryId }
        setCategories(categories: filteredCategories)
    }
    
    func setCategories(categories: [Category]) {
        self.categories = categories
    }
    
    func getCategories() -> [Category] {
        return self.categories
    }
}
