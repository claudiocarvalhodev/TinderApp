//
//  DetailProfileCell.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class DetailProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            if let user = user {
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                phraseLabel.text = user.phrase
            }
        }
    }
    
    let nameLabel: UILabel = .textBoldLabel(32)
    let ageLabel: UILabel = .textLabel(28)
    let phraseLabel: UILabel = .textLabel(18, numberOfLines: 2)
    
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
        let nameAndAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        nameAndAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAndAgeStackView, phraseLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchorSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}
