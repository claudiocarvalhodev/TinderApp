//
//  Loading.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class Loading: UIView {
    
    // MARK: - Properties
    
    let loadView: UIView = {
        let load = UIView()
        load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        load.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        load.layer.cornerRadius = 50
        load.layer.borderWidth = 1
        load.layer.borderColor = UIColor.red.cgColor
        return load
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.image = UIImage(named: "perfil")
        return image
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(loadView)
        loadView.center = center
        addSubview(profileImageView)
        profileImageView.center = center
        self.animation()
    }
    
    func animation() {
        UIView.animate(withDuration: 1.3, animations: {
            self.loadView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 125
            self.loadView.alpha = 0.3
        }) { (_) in
            self.loadView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 50
            self.loadView.alpha = 1
            
            self.animation()
        }
    }
}
