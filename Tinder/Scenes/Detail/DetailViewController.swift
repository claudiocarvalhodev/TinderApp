//
//  DetailViewController.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class DetailViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let cellId = "cellId"
    let headerId = "headerId"
    let profileId = "profileId"
    let photosId = "photosId"
    
    var deslikeButton: UIButton = .iconFooter(named: "icone-deslike")
    var likeButton: UIButton = .iconFooter(named: "icone-like")
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icone-down"), for: .normal)
        button.backgroundColor = UIColor(red: 232/255, green: 88/255, blue: 54/255, alpha: 1)
        button.clipsToBounds = true
        return button
    }()
    
    var callback: ((User?, Action) -> Void)?
    
    init() {
        super.init(collectionViewLayout: HeaderLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 134, right: 0)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(DetailProfileCell.self, forCellWithReuseIdentifier: profileId)
        collectionView.register(DetailPhotosCell.self, forCellWithReuseIdentifier: photosId)
        
        self.addBack()
        self.addFooter()
    }
    
    @objc func backPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func deslikePressed() {
        print("deslikePressed")
        self.callback?(self.user, Action.deslike)
        self.backPressed()
    }
    
    @objc func likePressed() {
        print("likePressed")
        self.callback?(self.user, Action.like)
        self.backPressed()
    }
    
    // MARK: - Helper Functions
    
    func addBack() {
        view.addSubview(backButton)
        backButton.frame = CGRect(x: view.bounds.width - 69,
                                  y: view.bounds.height * 0.7 - 24,
                                  width: 48,
                                  height: 48)
        
        backButton.layer.cornerRadius = 24
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    func addFooter() {
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, likeButton, UIView()])
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        stackView.anchor(top: nil,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         bottom: view.bottomAnchor,
                         padding: .init(top: 0, left: 16, bottom: 34, right: 16))
        
        deslikeButton.addTarget(self, action: #selector(deslikePressed), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
    }
}

 // MARK: - UICollectionViewDelegateFlowLayout

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
   }
   
   override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetailHeaderView
    header.user = self.user
       return header
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       return .init(width: view.bounds.width, height: view.bounds.height * 0.7)
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.item == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileId, for: indexPath) as! DetailProfileCell
        
        cell.user = self.user

        return cell
    }
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosId, for: indexPath) as! DetailPhotosCell
    return cell
   }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = UIScreen.main.bounds.width
        var height: CGFloat = UIScreen.main.bounds.width * 0.66
        
        if indexPath.item == 0 {
            let cell = DetailProfileCell(frame: CGRect(x: 0, y: 0, width: width, height: height))
            cell.user = self.user
            cell.layoutIfNeeded()
            
            let sizeEstimate = cell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = sizeEstimate.height
        }
        
        return .init(width: width, height: height)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let originY = view.bounds.height * 0.7 - 24
        if scrollView.contentOffset.y > 0 {
            self.backButton.frame.origin.y = originY - scrollView.contentOffset.y
        } else {
            self.backButton.frame.origin.y = originY + scrollView.contentOffset.y * -1
        }
    }
}
