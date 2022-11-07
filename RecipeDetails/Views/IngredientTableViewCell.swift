//
//  IngredientTableViewCell.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 07.11.2022.
//

import UIKit
import Resources

final class IngredientTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private let ingredientNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ingredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body()
        label.textColor = Colors.secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        contentView.addSubview(ingredientNameLabel)
        contentView.addSubview(ingredientMeasureLabel)
        
        ingredientMeasureLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            ingredientNameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left / 2),
            ingredientNameLabel.trailingAnchor.constraint(equalTo: ingredientMeasureLabel.leadingAnchor, constant: -contentView.layoutMargins.right / 2),
            ingredientNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            ingredientMeasureLabel.leadingAnchor.constraint(equalTo: ingredientNameLabel.trailingAnchor, constant: contentView.layoutMargins.left / 2),
            ingredientMeasureLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right / 2),
            ingredientMeasureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(name: String?, measure: String?) {
        ingredientNameLabel.text = name
        ingredientMeasureLabel.text = measure
    }
}
