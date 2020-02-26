//
//  PhotoSlideViewController.swift
//  Tinder
//
//  Created by claudiocarvalho on 25/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class PhotoSlideViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let cellId = "cellId"
    
    let photos: [String] = [
        "pessoa-1",
        "pessoa-2",
        "pessoa-3",
        "pessoa-4",
        "pessoa-5",
        "pessoa-6",
        "pessoa-7",
        "pessoa-8",
        "pessoa-9",
        "pessoa-10",
    ]
    
    // MARK: - Init
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(PhotoSlideCell.self, forCellWithReuseIdentifier: cellId)
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoSlideViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoSlideCell
        cell.photoImageView.image = UIImage(named: self.photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.height / 2 - 10
        return .init(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 0, right: 20)
    }
}
