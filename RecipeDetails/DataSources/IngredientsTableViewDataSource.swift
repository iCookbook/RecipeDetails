//
//  IngredientsTableViewDataSource.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 09.11.2022.
//

import UIKit
import Models

/// Class reponsible for providing data to the Table View.
///
/// It inherites from `NSObject` so we can declare conformance to `NSObjectProtocol` in Swift.
final class IngredientsTableViewDataSource: NSObject {
    
    // MARK: - Private Properties
    
    private var data: [Ingredient] = []
    
    // MARK: - Public Methods
    
    public func fillInData(data: [Ingredient]?) {
        self.data = data ?? []
    }
}

// MARK: - UITableViewDataSource

extension IngredientsTableViewDataSource: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as? IngredientTableViewCell else {
            fatalError("Could not cast table view cell to `IngredientTableViewCell` for indexPath: \(indexPath)")
        }
        let ingredient = data[indexPath.row]
        cell.configure(name: ingredient.food?.capitalized, quantity: ingredient.quantity, measure: ingredient.measure)
        return cell
    }
}
