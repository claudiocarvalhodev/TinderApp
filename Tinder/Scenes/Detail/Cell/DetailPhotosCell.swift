//
//  DetailPhotosCell.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class DetailPhotosCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let photoSlideViewController = PhotoSlideViewController()
    let descriptionLabel: UILabel = .textBoldLabel(16)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                trailing: trailingAnchor,
                                bottom: nil,
                                padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(photoSlideViewController.view)
        photoSlideViewController.view.anchor(top: descriptionLabel.bottomAnchor,
                                             leading: leadingAnchor,
                                             trailing: trailingAnchor,
                                             bottom: bottomAnchor,
                                             padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
        descriptionLabel.text = "Recent instagram photos"
    }
}
