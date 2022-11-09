//
//  RecipeDetailsAssembly.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import UIKit
import Models

public final class RecipeDetailsAssembly {
    
    // MARK: - Public Properties
    
    public let input: RecipeDetailsModuleInput
    public let viewController: UIViewController
    
    // MARK: - Private Properties
    
    private(set) weak var router: RecipeDetailsRouterInput!
    
    // MARK: - Public Methods
    
    public static func assemble(with context: RecipeDetailsContext) -> RecipeDetailsAssembly {
        let router = RecipeDetailsRouter()
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(router: router, interactor: interactor)
        let viewController = RecipeDetailsViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        interactor.recipe = context.recipe
        router.viewController = viewController
        
        return RecipeDetailsAssembly(view: viewController, input: presenter, router: router)
    }
    
    // MARK: - Init
    
    private init(view: UIViewController, input: RecipeDetailsModuleInput, router: RecipeDetailsRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

public struct RecipeDetailsContext {
    weak var moduleOutput: RecipeDetailsModuleOutput?
    let recipe: Recipe
    
    public init(moduleOutput: RecipeDetailsModuleOutput?, recipe: Recipe) {
        self.moduleOutput = moduleOutput
        self.recipe = recipe
    }
}
