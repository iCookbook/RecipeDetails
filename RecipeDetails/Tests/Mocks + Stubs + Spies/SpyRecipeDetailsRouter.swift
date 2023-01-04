//
//  SpyRecipeDetailsRouter.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

@testable import RecipeDetails

class SpyRecipeDetailsRouter: RecipeDetailsRouterInput {
    
    var didOpenWebRecipe: Bool!
    var urlForWebRecipe: URL!
    
    func openWebRecipe(by url: URL) {
        didOpenWebRecipe = true
        urlForWebRecipe = url
    }
}
