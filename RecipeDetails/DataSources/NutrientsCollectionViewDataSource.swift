//
//  NutrientsCollectionViewDataSource.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 09.11.2022.
//  

import UIKit
import Models

/// Class reponsible for providing data to the Collection View.
///
/// It inherites from `NSObject` so we can declare conformance to `NSObjectProtocol` in Swift.
final class NutrientsCollectionViewDataSource: NSObject {
    
    // MARK: - Private Properties
    
    private var data: [Digest] = []
    
    // MARK: - Public Methods
    
    public func fillInData(data: [Digest]?, calories: Double?, weight: Double?) {
        /// Create our own digests with data.
        self.data = [Digest(label: "Calories".localized, tag: nil, schemaOrgTag: nil, total: calories, hasRDI: nil, daily: nil),
                     Digest(label: "Weight".localized, tag: nil, schemaOrgTag: nil, total: weight, hasRDI: nil, daily: nil)]
        /// We need to get info only about 1. fats, 2. carbs and 3. proteins.
        self.data.append(contentsOf: Array(data?[0..<3] ?? []))
    }
}

// MARK: - UICollectionViewDataSource

extension NutrientsCollectionViewDataSource: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NutrientCollectionViewCell.identifier, for: indexPath) as? NutrientCollectionViewCell else {
            fatalError("Could not cast collection view cell to `NutrientCollectionViewCell` for indexPath: \(indexPath)")
        }
        let nutrient = data[indexPath.row]
        cell.configure(name: nutrient.label, quantity: nutrient.total)
        return cell
    }
}

