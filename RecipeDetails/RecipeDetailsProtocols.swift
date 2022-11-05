//
//  RecipeDetailsProtocols.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Foundation

public protocol RecipeDetailsModuleInput {
    var moduleOutput: RecipeDetailsModuleOutput? { get }
}

public protocol RecipeDetailsModuleOutput: AnyObject {
}

protocol RecipeDetailsViewInput: AnyObject {
}

protocol RecipeDetailsViewOutput: AnyObject {
}

protocol RecipeDetailsInteractorInput: AnyObject {
}

protocol RecipeDetailsInteractorOutput: AnyObject {
}

protocol RecipeDetailsRouterInput: AnyObject {
}

protocol RecipeDetailsRouterOutput: AnyObject {
}
