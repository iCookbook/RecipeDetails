//
//  RecipeDetailsPresenterTests.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 03.01.2023.
//

import XCTest
@testable import RecipeDetails
@testable import Models
@testable import Resources

class RecipeDetailsPresenterTests: XCTestCase {
    
    let mockRecipe = Recipe(label: nil, image: nil, images: nil, source: nil, url: nil, ingredients: nil, calories: nil, totalWeight: nil, yield: nil, totalTime: nil, dietLabels: nil, cuisineType: nil, mealType: nil, dishType: nil, digest: nil)
    let mockRouter = MockRecipeDetailsRouter()
    let mockInteractor = MockRecipeDetailsInteractor()
    
    var router: SpyRecipeDetailsRouter!
    var view: SpyRecipeDetailsView!
    var interactor: SpyRecipeDetailsInteractor!
    /// SUT.
    var presenter: RecipeDetailsPresenter!
    
    override func setUpWithError() throws {
        presenter = RecipeDetailsPresenter(router: mockRouter, interactor: mockInteractor)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        router = nil
        view = nil
    }
    
    func testCallingViewDidLoadMethod() throws {
        interactor = SpyRecipeDetailsInteractor()
        presenter = RecipeDetailsPresenter(router: mockRouter, interactor: interactor)
        
        presenter.viewDidLoad()
        
        XCTAssertNotNil(interactor.didProvidedData)
        XCTAssertTrue(interactor.didProvidedData)
    }
    
    func testTappingOnFavouriteButtonTrue() throws {
        interactor = SpyRecipeDetailsInteractor()
        presenter = RecipeDetailsPresenter(router: mockRouter, interactor: interactor)
        let expectation = expectation(description: "waitingForAnswerForInteractor")
        interactor.expectation = expectation
        
        presenter.favouriteButtonTapped(flag: true)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue(interactor.didAddRecipeToFavourites)
        XCTAssertNil(interactor.didRemoveRecipeFromFavourites)
    }
    
    func testTappingOnFavouriteButtonFalse() throws {
        interactor = SpyRecipeDetailsInteractor()
        presenter = RecipeDetailsPresenter(router: mockRouter, interactor: interactor)
        let expectation = expectation(description: "waitingForAnswerForInteractor")
        interactor.expectation = expectation
        
        presenter.favouriteButtonTapped(flag: false)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue(interactor.didRemoveRecipeFromFavourites)
        XCTAssertNil(interactor.didAddRecipeToFavourites)
    }
    
    func testProvidingRecipeToViewWithFavouriteTrue() throws {
        view = SpyRecipeDetailsView()
        presenter.view = view
        let isFavourite = true
        
        presenter.didProvideRecipe(mockRecipe, isFavourite: isFavourite)
        
        XCTAssertIdentical(view.recipeToConfigure, mockRecipe)
        XCTAssertEqual(view.isRecipeFavourite, isFavourite)
    }
    
    func testProvidingRecipeToViewWithFavouriteFalse() throws {
        view = SpyRecipeDetailsView()
        presenter.view = view
        let isFavourite = false
        
        presenter.didProvideRecipe(mockRecipe, isFavourite: isFavourite)
        
        XCTAssertIdentical(view.recipeToConfigure, mockRecipe)
        XCTAssertEqual(view.isRecipeFavourite, isFavourite)
    }
    
    func testProvidingRecipeSource() throws {
        view = SpyRecipeDetailsView()
        router = SpyRecipeDetailsRouter()
        presenter = RecipeDetailsPresenter(router: router, interactor: mockInteractor)
        presenter.view = view
        let link = "https://example.com"
        
        presenter.didProvideRecipeSource(urlString: link)
        
        XCTAssertEqual(router.urlForWebRecipe, URL(string: link)!)
        XCTAssertNotNil(router.didOpenWebRecipe)
        XCTAssertTrue(router.didOpenWebRecipe)
        
        XCTAssertNil(view.errorTitleToDisplay)
        XCTAssertNil(view.errorMessageToDisplay)
    }
    
    func testProvidingRecipeSourceWithError() throws {
        router = SpyRecipeDetailsRouter()
        presenter = RecipeDetailsPresenter(router: router, interactor: mockInteractor)
        view = SpyRecipeDetailsView()
        presenter.view = view
        
        presenter.didProvideRecipeSource(urlString: "")
        
        XCTAssertNil(router.didOpenWebRecipe)
        XCTAssertNil(router.urlForWebRecipe)
        
        XCTAssertNotNil(view.errorTitleToDisplay)
        XCTAssertEqual(view.errorTitleToDisplay, Texts.Errors.oops)
        XCTAssertNotNil(view.errorMessageToDisplay)
        XCTAssertEqual(view.errorMessageToDisplay, Texts.Errors.noRecipeSource)
    }
    
    func testWebRecipeButtonTapped() throws {
        interactor = SpyRecipeDetailsInteractor()
        presenter = RecipeDetailsPresenter(router: mockRouter, interactor: interactor)
        presenter.webRecipeButtonTapped()
        
        XCTAssertTrue(interactor.didProvideRecipeSource)
    }
}
