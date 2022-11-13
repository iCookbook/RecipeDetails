//
//  NutrientCollectionViewCell.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 07.11.2022.
//

import UIKit
import Resources

final class NutrientCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Properties
    
    private let nutrientNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.smallBody()
        return label
    }()
    
    private let nutrientQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.title()
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nutrientQuantityLabel, nutrientNameLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        contentView.backgroundColor = Colors.systemGroupedBackground
        contentView.layer.cornerRadius = 12
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right),
            mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(name: String?, quantity: Double?) {
        nutrientQuantityLabel.text = String(Int(quantity ?? 10.0))
        nutrientNameLabel.text = name?.localized
    }
}
