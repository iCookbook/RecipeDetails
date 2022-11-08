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
    
    /// Handles tapping on the favourite button.
    /// - Parameter flag: Defines whether favourite button was pressed or not.
    func favouriteButtonTapped(flag: Bool) {
        if flag {
            /// If it was already pressed, we remove it.
            interactor.removeRecipeFromFavourites()
        } else {
            /// If it was not pressed, we add it to an array.
            interactor.addRecipeToFavourites()
        }
    }
    
    func webRecipeButtonTapped() {
        interactor.requestRecipeSource()
    }
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    func didProvidedRecipe(_ recipe: Recipe) {
        view?.configure(with: recipe)
    }
    
    func didProvidedRecipeSource(urlString: String) {
        guard let url = URL(string: urlString) else {
            // TODO: Implement opening alert
            return
        }
        router.openWebRecipe(by: url)
    }
}
