//
//  UIImageView+Extensions.swift
//  Tinder
//
//  Created by claudiocarvalho on 24/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

extension UIImageView {
    static func photoImageView(named: String? = nil) -> UIImageView {
    let image = UIImageView()
        if let named = named {
            image.image = UIImage(named: named)
        }
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }
    
    static func iconCard(named: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: named)
        image.size(size: .init(width: 70, height: 70))
        image.alpha = 0.0
        return image
    }
}
