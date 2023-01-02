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
        label.font = Fonts.medium()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let ingredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body()
        label.textColor = Colors.secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
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
            ingredientNameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            ingredientNameLabel.trailingAnchor.constraint(equalTo: ingredientMeasureLabel.leadingAnchor),
            ingredientNameLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            ingredientNameLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            ingredientMeasureLabel.leadingAnchor.constraint(equalTo: ingredientNameLabel.trailingAnchor),
            ingredientMeasureLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            ingredientMeasureLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            ingredientMeasureLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(name: String?, quantity: Double?, measure: String?) {
        ingredientNameLabel.text = name
        let roundedQuantity: Double = round((quantity ?? 1.0) * 100) / 100
        ingredientMeasureLabel.text = "\(NSNumber(floatLiteral: roundedQuantity).stringValue) \(measure ?? "tbsp")"
    }
}
