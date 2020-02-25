//
//  CombineCardView.swift
//  Tinder
//
//  Created by claudiocarvalho on 24/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class CombineCardView: UIView {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.photo)
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                phraseLabel.text = user.phrase
            }
        }
    }
    
    let photoImageView: UIImageView = .photoImageView()
    
    let nameLabel: UILabel = .textBoldLabel(32, textColor: .white)
    let ageLabel: UILabel = .textLabel(28, textColor: .white)
    let phraseLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 2)
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    let likeImageView: UIImageView = .iconCard(named: "card-like")
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(photoImageView)
        photoImageView.anchorSuperview()
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        phraseLabel.addShadow()
        
        addSubview(deslikeImageView)
        deslikeImageView.anchor(top: topAnchor,
                                leading: nil,
                                trailing: trailingAnchor,
                                bottom: nil,
                                padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        addSubview(likeImageView)
        likeImageView.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                trailing: nil,
                                bottom: nil,
                                padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        let nameAndAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        nameAndAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAndAgeStackView, phraseLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: nil,
                         leading: leadingAnchor,
                         trailing: trailingAnchor,
                         bottom: bottomAnchor,
                         padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
}
