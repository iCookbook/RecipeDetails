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
}

protocol RecipeDetailsInteractorInput: AnyObject {
    func requestData()
}

protocol RecipeDetailsInteractorOutput: AnyObject {
    func didProvidedRecipe(_ recipe: Recipe)
}

protocol RecipeDetailsRouterInput: AnyObject {
}

protocol RecipeDetailsRouterOutput: AnyObject {
}
