//
//  IngredientsTableView.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 07.11.2022.
//

import UIKit

final class IngredientsTableView: UITableView {
    
    // MARK: - Init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        rowHeight = 44
        estimatedRowHeight = 44
        backgroundColor = .clear
        register(IngredientTableViewCell.self, forCellReuseIdentifier: IngredientTableViewCell.identifier)
        allowsSelection = false
        isScrollEnabled = false
        contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// This code allows to set table view `contentSize` correctly, so there's no need for setting `heightAnchor` in constraints inside `UIScrollView`
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
