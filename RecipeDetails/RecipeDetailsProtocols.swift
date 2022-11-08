//
//  RecipeDetailsProtocols.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Models

public protocol RecipeDetailsModuleInput {
    var moduleOutput: RecipeDetailsModuleOutput? { get }
}

public protocol RecipeDetailsModuleOutput: AnyObject {
}

protocol RecipeDetailsViewInput: AnyObject {
    func configure(with data: Recipe)
}

protocol RecipeDetailsViewOutput: AnyObject {
    func requestData()
    func favouriteButtonTapped(flag: Bool)
    func webRecipeButtonTapped()
}

protocol RecipeDetailsInteractorInput: AnyObject {
    func requestData()
    func addRecipeToFavourites()
    func removeRecipeFromFavourites()
    func requestRecipeSource()
}

protocol RecipeDetailsInteractorOutput: AnyObject {
    func didProvidedRecipe(_ recipe: Recipe)
    func didProvidedRecipeSource(urlString: String)
}

protocol RecipeDetailsRouterInput: AnyObject {
    func openWebRecipe(by url: URL)
}

protocol RecipeDetailsRouterOutput: AnyObject {
}
