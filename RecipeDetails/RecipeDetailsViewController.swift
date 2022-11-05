//
//  RecipeDetailsViewController.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import UIKit

final class RecipeDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let output: RecipeDetailsViewOutput
    
    // MARK: - Init
    
    init(output: RecipeDetailsViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension RecipeDetailsViewController: RecipeDetailsViewInput {
}
