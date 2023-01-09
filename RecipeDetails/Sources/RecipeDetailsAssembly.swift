//
//  RecipeDetailsAssembly.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import UIKit

public final class RecipeDetailsAssembly {
    
    // MARK: - Public Properties
    
    public let input: RecipeDetailsModuleInput
    public let viewController: UIViewController
    
    // MARK: - Private Properties
    
    private(set) weak var router: RecipeDetailsRouterInput!
    
    // MARK: - Public Methods
    
    public static func assemble(with context: RecipeDetailsDependenciesProtocol) -> RecipeDetailsAssembly {
        let router = RecipeDetailsRouter()
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(router: router, interactor: interactor)
        let viewController = RecipeDetailsViewController(presenter: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.presenter = presenter
        interactor.recipe = context.dataModel
        
        router.viewController = viewController
        router.presenter = presenter
        
        return RecipeDetailsAssembly(view: viewController, input: presenter, router: router)
    }
    
    // MARK: - Init
    
    private init(view: UIViewController, input: RecipeDetailsModuleInput, router: RecipeDetailsRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}
