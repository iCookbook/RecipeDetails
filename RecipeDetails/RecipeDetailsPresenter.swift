//
//  RecipeDetailsPresenter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Models

final class RecipeDetailsPresenter {
    weak var view: RecipeDetailsViewInput?
    weak var moduleOutput: RecipeDetailsModuleOutput?
    
    // MARK: - Private Properties
    
    private let router: RecipeDetailsRouterInput
    private let interactor: RecipeDetailsInteractorInput
    
    // MARK: - Init
    
    init(router: RecipeDetailsRouterInput, interactor: RecipeDetailsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension RecipeDetailsPresenter: RecipeDetailsModuleInput {
}

extension RecipeDetailsPresenter: RecipeDetailsViewOutput {
    func requestData() {
        interactor.requestData()
    }
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    func didProvidedRecipe(_ recipe: Recipe) {
        view?.configure(with: recipe)
    }
}
