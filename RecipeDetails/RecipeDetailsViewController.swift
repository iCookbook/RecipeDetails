//
//  RecipeDetailsViewController.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//  
//

import UIKit
import CommonUI
import Models
import Resources

final class RecipeDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let output: RecipeDetailsViewOutput
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        
        setupView()
        output.requestData()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = Colors.systemBackground
    }
}

extension RecipeDetailsViewController: RecipeDetailsViewInput {
    func configure(with data: Recipe) {
        title = data.label
        recipeImageView.loadImage(for: data.images?.regular?.url)
    }
}
