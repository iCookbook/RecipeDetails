//
//  RecipeDetailsRouter.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  

import UIKit
import SafariServices

final class RecipeDetailsRouter {
    weak var presenter: RecipeDetailsRouterOutput?
    weak var viewController: UIViewController?
}

extension RecipeDetailsRouter: RecipeDetailsRouterInput {
    
    /// Opens controller with safari web view for provided link.
    ///
    /// - Parameter url: url to the web page to open.
    func openWebRecipe(by url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        viewController?.present(safariVC, animated: true, completion: nil)
    }
}
