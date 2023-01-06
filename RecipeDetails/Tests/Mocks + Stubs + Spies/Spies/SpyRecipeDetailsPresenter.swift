//
//  SpyRecipeDetailsPresenter.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 03.01.2023.
//

@testable import RecipeDetails
@testable import Models

class SpyRecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    
    var recipe: Recipe!
    var isFavourite: Bool!
    var urlString: String!
    
    func didProvideRecipe(_ recipe: Recipe, isFavourite: Bool) {
        self.recipe = recipe
        self.isFavourite = isFavourite
    }
    
    func didProvideRecipeSource(urlString: String) {
        self.urlString = urlString
    }
}
