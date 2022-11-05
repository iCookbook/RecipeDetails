//
//  RecipeDetailsRouter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import UIKit

final class RecipeDetailsRouter {
    weak var output: RecipeDetailsRouterOutput?
    weak var viewController: UIViewController?
}

extension RecipeDetailsRouter: RecipeDetailsRouterInput {
}
