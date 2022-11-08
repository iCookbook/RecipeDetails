//
//  RecipeDetailsInteractor.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Models
import Persistence

final class RecipeDetailsInteractor {
    weak var output: RecipeDetailsInteractorOutput?
    var recipe: Models.Recipe!
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    func requestData() {
        output?.didProvidedRecipe(recipe)
    }
    
    func addRecipeToFavourites() {
        UserDefaults.favouriteRecipes.append(recipe)
    }
    
    func removeRecipeFromFavourites() {
        if let index = UserDefaults.favouriteRecipes.firstIndex(of: recipe) {
            UserDefaults.favouriteRecipes.remove(at: index)
        }
    }
    
    func requestRecipeSource() {
        guard let urlString = recipe.url else {
            // TODO: Implement providing error to presenter
            return
        }
        output?.didProvidedRecipeSource(urlString: urlString)
    }
}
