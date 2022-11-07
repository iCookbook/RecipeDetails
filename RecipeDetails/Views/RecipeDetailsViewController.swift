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
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28
        view.backgroundColor = Colors.systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let recipeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nutrientsCollectionViewDataSource: [Digest] = []
    
    private lazy var nutrientsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(NutrientCollectionViewCell.self, forCellWithReuseIdentifier: NutrientCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var ingredientsTableViewDataSource: [Ingredient] = []
    
    private lazy var ingredientsTableView: UITableView = {
        let tableView = IngredientsTableView()
        tableView.dataSource = self
        return tableView
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
        
        view.addSubview(scrollView)
        scrollView.addSubview(recipeImageView)
        scrollView.addSubview(topView)
        topView.addSubview(recipeImageView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(recipeDescriptionLabel)
        contentView.addSubview(nutrientsCollectionView)
        contentView.addSubview(ingredientsTableView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            recipeImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: topView.topAnchor),
            recipeImageView.heightAnchor.constraint(equalTo: recipeImageView.widthAnchor, multiplier: 383/414),
            
            contentView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: -40),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            recipeDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            recipeDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            recipeDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            nutrientsCollectionView.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor, constant: 20),
            nutrientsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nutrientsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            nutrientsCollectionView.bottomAnchor.constraint(equalTo: ingredientsTableView.topAnchor, constant: 20),
//            nutrientsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            ingredientsTableView.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ingredientsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension RecipeDetailsViewController: RecipeDetailsViewInput {
    func configure(with data: Recipe) {
        title = data.label
        recipeImageView.loadImage(for: data.images?.regular?.url)
        
        nutrientsCollectionViewDataSource = data.digest ?? []
        nutrientsCollectionView.reloadData()
        ingredientsTableViewDataSource = data.ingredients ?? []
        ingredientsTableView.reloadData()
        
        recipeDescriptionLabel.text = "Bring colour to your dinner table with our \(data.label ?? Texts.Discover.mockRecipeTitle). Packed with nutrients, it's a satisfying veggie lunch or supper for the family"
    }
}

// MARK: - Table View

extension RecipeDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientsTableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as? IngredientTableViewCell else {
            fatalError("Could not cast table view cell to `IngredientTableViewCell` for indexPath: \(indexPath)")
        }
        let ingredient = ingredientsTableViewDataSource[indexPath.row]
        cell.configure(name: ingredient.food?.capitalized, measure: "\(NSNumber(floatLiteral: ingredient.quantity ?? 1).stringValue) \(ingredient.measure ?? "tbsp")")
        return cell
    }
}

// MARK: - Collection View

extension RecipeDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nutrientsCollectionViewDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NutrientCollectionViewCell.identifier, for: indexPath) as? NutrientCollectionViewCell else {
            fatalError("Could not cast collection view cell to `NutrientCollectionViewCell` for indexPath: \(indexPath)")
        }
        let nutrient = nutrientsCollectionViewDataSource[indexPath.row]
        cell.configure(name: nutrient.label, quantity: String(nutrient.total ?? 0.0))
        return cell
    }
}
