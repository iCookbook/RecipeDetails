//
//  RecipeDetailsPresenter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import Foundation

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
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
}
