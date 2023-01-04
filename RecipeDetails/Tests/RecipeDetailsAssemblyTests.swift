//
//  RecipeDetailsAssemblyTests.swift
//  RecipeDetails-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import XCTest
@testable import RecipeDetails
@testable import Models

class RecipeDetailsAssemblyTests: XCTestCase {
    
    let mockRecipe = Recipe(label: nil, image: nil, images: nil, source: nil, url: nil, ingredients: nil, calories: nil, totalWeight: nil, yield: nil, totalTime: nil, dietLabels: nil, cuisineType: nil, mealType: nil, dishType: nil, digest: nil)
    /// SUT.
    var assembly: RecipeDetailsAssembly!
    var context: RecipeDetailsContext!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    /**
     In the next tests we will check that the module consists of the correct parts and all dependencies are filled in.
     The tests will differ by creating different contexts
     */
    
    func testAssemblingWithModuleOutput() throws {
        let moduleOutput = MockRecipeDetailsPresenter()
        context = RecipeDetailsContext(moduleOutput: moduleOutput, recipe: mockRecipe)
        assembly = RecipeDetailsAssembly.assemble(with: context)
        
        XCTAssertNotNil(assembly.input)
        XCTAssertNotNil(assembly.router, "Module router should not be nil")
        XCTAssertNotNil(assembly.viewController)
        
        guard let _ = assembly.viewController as? RecipeDetailsViewController,
              let presenter = assembly.input as? RecipeDetailsPresenter,
              let _ = assembly.router as? RecipeDetailsRouter
        else {
            XCTFail("Module was assebled with wrong components")
            return
        }
        XCTAssertIdentical(moduleOutput, presenter.moduleOutput, "All injected dependencies should be identical")
    }
    
    func testAssemblingWithoutModuleOutput() throws {
        context = RecipeDetailsContext(moduleOutput: nil, recipe: mockRecipe)
        assembly = RecipeDetailsAssembly.assemble(with: context)
        
        XCTAssertNotNil(assembly.input)
        XCTAssertNotNil(assembly.router)
        XCTAssertNotNil(assembly.viewController)
        
        guard let _ = assembly.viewController as? RecipeDetailsViewController,
              let presenter = assembly.input as? RecipeDetailsPresenter,
              let _ = assembly.router as? RecipeDetailsRouter
        else {
            XCTFail("Module was assebled with wrong components")
            return
        }
        XCTAssertNil(presenter.moduleOutput, "Module output was not provided and should be nil")
    }
}
