//
//  SpyRecipeDetailsInteractor.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import XCTest
@testable import RecipeDetails

class SpyRecipeDetailsInteractor: RecipeDetailsInteractorInput {
    
    var didProvidedData: Bool!
    var didAddRecipeToFavourites: Bool!
    var didRemoveRecipeFromFavourites: Bool!
    var expectation: XCTestExpectation!
    var didProvideRecipeSource: Bool!
    
    func provideData() {
        didProvidedData = true
    }
    
    func addRecipeToFavourites() {
        didAddRecipeToFavourites = true
        
        if let expectation = expectation {
            expectation.fulfill()
        }
    }
    
    func removeRecipeFromFavourites() {
        didRemoveRecipeFromFavourites = true
        
        if let expectation = expectation {
            expectation.fulfill()
        }
    }
    
    func provideRecipeSource() {
        didProvideRecipeSource = true
    }
}
