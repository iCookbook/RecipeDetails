//
//  RecipeDetailsRouter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import UIKit
import CommonUI

final class RecipeDetailsRouter {
    weak var output: RecipeDetailsRouterOutput?
    weak var viewController: UIViewController?
}

extension RecipeDetailsRouter: RecipeDetailsRouterInput {
    
    /// Opens controller with web view (`WebKit`) with provided link.
    /// - Parameter url: url to the web page to open.
    func openWebRecipe(by url: URL) {
        let destination = UINavigationController(rootViewController: WebViewController(url: url))
        destination.modalPresentationStyle = .fullScreen
        viewController?.present(destination, animated: true)
    }
}
