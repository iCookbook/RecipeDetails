//
//  RecipeDetailsInteractor.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import Models
import Persistence

final class RecipeDetailsInteractor {
    weak var output: RecipeDetailsInteractorOutput?
    /// Data for this module. Recipe to show.
    var recipe: Models.Recipe!
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    /// Provides data to the presenter.
    func provideData() {
        output?.didProvidedRecipe(recipe, isFavourite: UserDefaults.favouriteRecipes.contains(recipe))
    }
    
    /// Adds recipe to favourites using `UserDefaults`
    func addRecipeToFavourites() {
        UserDefaults.favouriteRecipes.append(recipe)
    }
    
    /// Removes recipe from favourites in `UserDefaults`.
    ///
    /// If user tries to remove recipe from favourites, it will try to find it in `UserDefaults` and then remove it by its' index.
    func removeRecipeFromFavourites() {
        if let index = UserDefaults.favouriteRecipes.firstIndex(of: recipe) {
            UserDefaults.favouriteRecipes.remove(at: index)
        }
    }
    
    /// Provides recipe's source from interactor
    func provideRecipeSource() {
        guard let urlString = recipe.url else {
            // TODO: Implement providing error to presenter
            return
        }
        output?.didProvidedRecipeSource(urlString: urlString)
    }
}
