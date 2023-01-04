//
//  SpyRecipeDetailsView.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

@testable import RecipeDetails
@testable import Models

class SpyRecipeDetailsView: RecipeDetailsViewInput {
    
    var recipeToConfigure: Recipe!
    var isRecipeFavourite: Bool!
    
    var errorTitleToDisplay: String!
    var errorMessageToDisplay: String!
    
    func configure(with data: Recipe, isFavourite: Bool) {
        recipeToConfigure = data
        isRecipeFavourite = isFavourite
    }
    
    func displayError(title: String, message: String) {
        errorTitleToDisplay = title
        errorMessageToDisplay = message
    }
}
