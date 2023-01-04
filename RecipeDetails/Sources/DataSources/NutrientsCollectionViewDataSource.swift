//
//  NutrientsCollectionViewDataSource.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 09.11.2022.
//  

import UIKit
import Models
import Resources

/// Class reponsible for providing data to the Collection View.
///
/// It inherites from `NSObject` so we can declare conformance to `NSObjectProtocol` in Swift.
final class NutrientsCollectionViewDataSource: NSObject {
    
    // MARK: - Private Properties
    
    /// Data for this data source.
    private var data: [Digest] = []
    
    // MARK: - Public Methods
    
    /// Fulfills data for this data source.
    ///
    /// - Parameter data: `Recipe` instance to get `digest` data from.
    public func fillInData(data: Recipe) {
        /// We need to get info only about 1. fats, 2. carbs and 3. proteins.
        let fatDigest = data.digest?[0]
        let carbsDigest = data.digest?[1]
        let proteinDigest = data.digest?[2]
        
        /// Create our own digests with data.
        self.data = [Digest(label: Texts.RecipeDetails.calories(count: Int(data.calories ?? 0)), total: data.calories),
                     Digest(label: "Weight, g".localized, total: data.totalWeight),
                     Digest(label: Texts.RecipeDetails.servings(count: Int(data.yield ?? 4)), total: data.yield ?? 4),
                     Digest(label: Texts.RecipeDetails.minutes(count: Int(data.totalTime ?? 50)), total: data.totalTime),
                     Digest(label: Texts.RecipeDetails.protein(count: Int(proteinDigest?.total ?? 0)), total: proteinDigest?.total),
                     Digest(label: Texts.RecipeDetails.fat(count: Int(fatDigest?.total ?? 0)), total: fatDigest?.total),
                     Digest(label: Texts.RecipeDetails.carbs(count: Int(carbsDigest?.total ?? 0)), total: carbsDigest?.total)]
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

