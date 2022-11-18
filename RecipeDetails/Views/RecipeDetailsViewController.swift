//
//  RecipeDetailsViewController.swift
//  Pods
//
//  Created by Егор Бадмаев on 05.11.2022.
//

import UIKit
import CommonUI
import Models
import Resources

final class RecipeDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: RecipeDetailsViewOutput
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.preservesSuperviewLayoutMargins = true
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
        button.layer.zPosition = 2
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
    
    private let nutrientsCollectionViewDataSource = NutrientsCollectionViewDataSource()
    private lazy var nutrientsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 100, height: 70)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = nutrientsCollectionViewDataSource
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(NutrientCollectionViewCell.self, forCellWithReuseIdentifier: NutrientCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 0, right: 16)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let ingredientsTableViewDataSource = IngredientsTableViewDataSource()
    private lazy var ingredientsTableView: UITableView = {
        let tableView = NonScrollableTableView(frame: .zero, style: .grouped)
        tableView.rowHeight = 44
        tableView.estimatedSectionHeaderHeight = 40
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.dataSource = ingredientsTableViewDataSource
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: IngredientTableViewCell.identifier)
        tableView.register(TitleTableViewHeader.self, forHeaderFooterViewReuseIdentifier: TitleTableViewHeader.identifier)
        tableView.sectionFooterHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
    }()
    
    private lazy var sourceLinkButton: UIButton = {
        let button = UIButton()
        // TODO: Set tint's color of the application as background color
        button.backgroundColor = .brown
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
    
    init(presenter: RecipeDetailsViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter.requestData()
    }
    
    // MARK: - Private Methods
    
    /// Handles tapping on `favouriteRecipeButton`.
    @objc private func favouriteButtonTapped() {
        favouriteRecipeButtonPressed.toggle()
        // animating tapping
        UIView.transition(with: favouriteRecipeButton, duration: 0.15, options: .transitionCrossDissolve, animations: { [unowned self] in
            changeFavouriteButtonImage()
        })
        presenter.favouriteButtonTapped(flag: favouriteRecipeButtonPressed)
    }
    
    /// Changes favourite button's image depending on whether is it pressed or not.
    private func changeFavouriteButtonImage() {
        if favouriteRecipeButtonPressed {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.heart, for: .normal)
        } else {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.filledHeart, for: .normal)
        }
    }
    
    @objc private func sourceLinkButtonTapped() {
        presenter.webRecipeButtonTapped()
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
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            recipeDescriptionLabel.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 10),
            recipeDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipeDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            nutrientsCollectionView.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor),
            nutrientsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nutrientsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nutrientsCollectionView.bottomAnchor.constraint(equalTo: ingredientsTableView.topAnchor),
            nutrientsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            ingredientsTableView.topAnchor.constraint(equalTo: nutrientsCollectionView.bottomAnchor),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            sourceLinkButton.topAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor),
            sourceLinkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sourceLinkButton.heightAnchor.constraint(equalToConstant: 36),
            sourceLinkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
        ])
    }
}

extension RecipeDetailsViewController: RecipeDetailsViewInput {
    /// Fills in views with data.
    /// - Parameter data: data to fill in.
    func configure(with data: Models.Recipe, isFavourite: Bool) {
        title = data.label
        recipeImageView.loadImage(for: data.images?.regular?.url)
        recipeDescriptionLabel.text = data.description
        
        nutrientsCollectionViewDataSource.fillInData(data: data)
        nutrientsCollectionView.reloadData()
        ingredientsTableViewDataSource.fillInData(data: data.ingredients)
        ingredientsTableView.reloadData()
        
        /// Changes `favouriteRecipeButton`'s image according to the provided from function argument.
        if isFavourite {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.filledHeart, for: .normal)
        } else {
            favouriteRecipeButton.setImage(Resources.Images.RecipeDetails.heart, for: .normal)
        }
        /// We set button's title as the source's name.
        sourceLinkButton.setTitle(data.source, for: .normal)
    }
}

extension RecipeDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleTableViewHeader.identifier) as? TitleTableViewHeader else {
            fatalError("Could not cast header in section \(section) to 'TitleTableViewHeader' in 'RecipeDetails' module")
        }
        header.configure(title: Texts.RecipeDetails.titleIngredients)
        return header
    }
}
