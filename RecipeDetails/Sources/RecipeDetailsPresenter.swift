//
//  RecipeDetailsPresenter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import Models
import Resources

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
    
    /// Called in the end of view's `viewDidLoad` method.
    func viewDidLoad() {
        interactor.provideData()
    }
    
    /// Handles tapping on the favourite button.
    /// - Parameter flag: Defines whether favourite button was pressed or not.
    func favouriteButtonTapped(flag: Bool) {
        DispatchQueue.global(qos: .background).async {
            /// If it was pressed (true), we remove it. If it was de-pressed (false), we add it to an array.
            flag ? self.interactor.addRecipeToFavourites() : self.interactor.removeRecipeFromFavourites()
        }
    }
    
    /// Asks interactor for link to open in web.
    func webRecipeButtonTapped() {
        interactor.provideRecipeSource()
    }
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    /// Provides data from interactor.
    ///
    /// - Parameters:
    ///   - recipe: `Recipe` instance provided from the interactor
    ///   - isFavourite: defines whether provided recipe is favourite or not.
    func didProvideRecipe(_ recipe: Recipe, isFavourite: Bool) {
        view?.configure(with: recipe, isFavourite: isFavourite)
    }
    
    /// Provides the link from interactor.
    ///
    /// - Parameter urlString: link to the recipe.
    func didProvideRecipeSource(urlString: String) {
        guard let url = URL(string: urlString) else {
            view?.displayError(title: Texts.Errors.oops, message: Texts.Errors.noRecipeSource)
            return
        }
        router.openWebRecipe(by: url)
    }
}

extension RecipeDetailsPresenter: RecipeDetailsRouterOutput {
}
