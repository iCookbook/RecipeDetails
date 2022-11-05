//
//  RecipeDetailsInteractor.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Models

final class RecipeDetailsInteractor {
    weak var output: RecipeDetailsInteractorOutput?
    var recipe: Recipe!
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    func requestData() {
        output?.didProvidedRecipe(recipe)
    }
}
