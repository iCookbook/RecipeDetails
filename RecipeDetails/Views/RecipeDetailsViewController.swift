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
import Persistence

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
    
    private var favouriteRecipeButtonPressed = false
    
    private lazy var favouriteRecipeButton: UIButton = {
        let button = UIButton()
        button.setImage(Resources.Images.RecipeDetails.heart, for: .normal)
        button.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
        button.backgroundColor = Colors.systemBackground
        button.layer.cornerRadius = 18
        button.layer.zPosition = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 2.0
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private let titleDescriptionLabel = TitleLabel(text: Texts.RecipeDetails.titleDescription)
    
    private let recipeDescriptionLabel: UILabel = {
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
        layout.itemSize = CGSize(width: 100, height: 70)
        layout.estimatedItemSize = CGSize(width: 100, height: 70)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(NutrientCollectionViewCell.self, forCellWithReuseIdentifier: NutrientCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let titleIngredientsLabel = TitleLabel(text: Texts.RecipeDetails.titleIngredients)
    
    private var ingredientsTableViewDataSource: [Ingredient] = []
    
    private lazy var ingredientsTableView: UITableView = {
        let tableView = IngredientsTableView()
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var sourceLinkButton: UIButton = {
        let button = UIButton()
        // TODO: Set tint's color of the application as background color
        button.backgroundColor = .yellow
        button.setTitleColor(UIColor.white, for: .normal)
        button.setImage(Resources.Images.RecipeDetails.safari, for: .normal)
        button.addTarget(self, action: #selector(sourceLinkButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = Fonts.buttonTitle()
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.15).cgColor
        button.layer.borderWidth = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    @objc private func favouriteButtonTapped() {
        favouriteRecipeButtonPressed.toggle()
        UIView.transition(with: favouriteRecipeButton, duration: 0.15, options: .transitionCrossDissolve, animations: { [unowned self] in
            changeFavouriteButtonImage()
        })
        output.favouriteButtonTapped(flag: favouriteRecipeButtonPressed)
    }
    
    private func changeFavouriteButtonImage() {
        if favouriteRecipeButtonPressed {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.heart, for: .normal)
        } else {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.filledHeart, for: .normal)
        }
    }
    
    @objc private func sourceLinkButtonTapped() {
        output.webRecipeButtonTapped()
    }
    
    private func setupView() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = Colors.systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(recipeImageView)
        scrollView.addSubview(topView)
        topView.addSubview(recipeImageView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(favouriteRecipeButton)
        contentView.addSubview(titleDescriptionLabel)
        contentView.addSubview(recipeDescriptionLabel)
        contentView.addSubview(nutrientsCollectionView)
        
        contentView.addSubview(titleIngredientsLabel)
        contentView.addSubview(ingredientsTableView)
        contentView.addSubview(sourceLinkButton)
        
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
            
            favouriteRecipeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -16),
            favouriteRecipeButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -40),
            favouriteRecipeButton.heightAnchor.constraint(equalToConstant: 36),
            favouriteRecipeButton.widthAnchor.constraint(equalToConstant: 36),
            
            recipeImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: topView.topAnchor),
            recipeImageView.heightAnchor.constraint(equalTo: recipeImageView.widthAnchor, multiplier: 383/414),
            
            contentView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: -40),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            titleDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            recipeDescriptionLabel.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 10),
            recipeDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            recipeDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            nutrientsCollectionView.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor),
            nutrientsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nutrientsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nutrientsCollectionView.bottomAnchor.constraint(equalTo: titleIngredientsLabel.topAnchor),
            nutrientsCollectionView.heightAnchor.constraint(equalToConstant: 112),
            
            titleIngredientsLabel.topAnchor.constraint(equalTo: nutrientsCollectionView.bottomAnchor),
            titleIngredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            titleIngredientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            ingredientsTableView.topAnchor.constraint(equalTo: titleIngredientsLabel.bottomAnchor, constant: 6),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            sourceLinkButton.topAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor, constant: 18),
            sourceLinkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sourceLinkButton.heightAnchor.constraint(equalToConstant: 36),
            sourceLinkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
        ])
    }
}

extension RecipeDetailsViewController: RecipeDetailsViewInput {
    func configure(with data: Models.Recipe) {
        title = data.label
        recipeImageView.loadImage(for: data.images?.regular?.url)
        
        nutrientsCollectionViewDataSource = Array(data.digest?[0..<4] ?? [])
        nutrientsCollectionView.reloadData()
        ingredientsTableViewDataSource = data.ingredients ?? []
        ingredientsTableView.reloadData()
        
        recipeDescriptionLabel.text = "Bring colour to your dinner table with our \(data.label ?? Texts.Discover.mockRecipeTitle). Packed with nutrients, it's a satisfying lunch or supper for the family"
        
        if UserDefaults.favouriteRecipes.contains(data) {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.filledHeart, for: .normal)
        } else {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.heart, for: .normal)
        }
        sourceLinkButton.setTitle(data.source, for: .normal)
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
        cell.configure(name: ingredient.food?.capitalized, quantity: ingredient.quantity, measure: ingredient.measure)
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
        cell.configure(name: nutrient.label, quantity: nutrient.total)
        return cell
    }
}
