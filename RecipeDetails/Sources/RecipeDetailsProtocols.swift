//
//  RecipeDetailsProtocols.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import Models

public protocol RecipeDetailsModuleInput {
    var moduleOutput: RecipeDetailsModuleOutput? { get }
}

public protocol RecipeDetailsModuleOutput: AnyObject {
}

protocol RecipeDetailsViewInput: AnyObject {
    func configure(with data: Recipe, isFavourite: Bool)
    func displayError(title: String, message: String)
}

protocol RecipeDetailsViewOutput: AnyObject {
    func viewDidLoad()
    func favouriteButtonTapped(flag: Bool)
    func webRecipeButtonTapped()
}

protocol RecipeDetailsInteractorInput: AnyObject {
    func provideData()
    func addRecipeToFavourites()
    func removeRecipeFromFavourites()
    func provideRecipeSource()
}

protocol RecipeDetailsInteractorOutput: AnyObject {
    func didProvideRecipe(_ recipe: Recipe, isFavourite: Bool)
    func didProvideRecipeSource(urlString: String)
}

protocol RecipeDetailsRouterInput: AnyObject {
    func openWebRecipe(by url: URL)
}

protocol RecipeDetailsRouterOutput: AnyObject {
}
