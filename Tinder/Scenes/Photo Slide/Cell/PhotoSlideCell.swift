//
//  PhotoSlideCell.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class PhotoSlideCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var photoImageView: UIImageView = .photoImageView()
    
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
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(photoImageView)
        photoImageView.anchorSuperview()
    }
}
