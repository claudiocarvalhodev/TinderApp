//
//  CombineViewController.swift
//  Tinder
//
//  Created by claudiocarvalho on 24/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//


import UIKit

enum Action {
    case deslike
    case superlike
    case like
}

class CombineViewController: UIViewController {
    
    // MARK: - Properties
    
    var users: [User] = []
    var profileButton: UIButton = .iconMenu(named: "icone-perfil")
    var chatButton: UIButton = .iconMenu(named: "icone-chat")
    var logoButton: UIButton = .iconMenu(named: "icone-logo")
    var deslikeButton: UIButton = .iconFooter(named: "icone-deslike")
    var superlikeButton: UIButton = .iconFooter(named: "icone-superlike")
    var likeButton: UIButton = .iconFooter(named: "icone-like")
    
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func handlerCard(_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view as? CombineCardView {
            let point = gesture.translation(in: view)
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.deslikeImageView.alpha = 0
            } else {
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotationAngle * 5 * -1
            }
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)

            if gesture.state == .ended {
                
                if card.center.x > self.view.bounds.width + 50{
                    print("like")
                    self.animationCard(rotationAngle: rotationAngle, action: .like)
                    return
                }
                
                if card.center.x < -50{
                    print("deslike")
                    self.animationCard(rotationAngle: rotationAngle, action: .deslike)
                    return
                }
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0
                }
            }
        }
    }
    
    @objc func deslikePressed() {
        self.animationCard(rotationAngle: 0.4, action: .deslike)
    }
    
    @objc func superlikePressed() {
        self.animationCard(rotationAngle: 0, action: .superlike)
    }
    
    @objc func likePressed() {
        self.animationCard(rotationAngle: 0.4, action: .like)
    }
    
    // MARK: - Helper Functions
    
    func fetchUsers() {
        UserService.shared.fetchUsers { (users, error) in
            if let users = users {
                DispatchQueue.main.async {
                    self.users = users
                    self.addCard()
                }
            }
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        let loading = Loading(frame: view.frame)
        view.insertSubview(loading, at: 0)
        addHeader()
        addFooter()
        fetchUsers()
    }
    
    func addHeader() {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top: CGFloat = window?.safeAreaInsets.top ?? 44
        
        let stackView = UIStackView(arrangedSubviews: [profileButton, logoButton, chatButton])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         bottom: nil,
                         padding: .init(top: top, left: 16, bottom: 0, right: 16))
    }
    
    func addCard() {
        
        for user in users {
            let card = CombineCardView()
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            card.center = view.center
            
            card.user = user
            card.tag = user.id
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            
            card.addGestureRecognizer(gesture)
            
            view.insertSubview(card, at: 1)
        }
    }
    
    func addFooter() {
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, superlikeButton, likeButton, UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.anchor(top: nil,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         bottom: view.bottomAnchor,
                         padding: .init(top: 0, left: 16, bottom: 34, right: 16))
        
        deslikeButton.addTarget(self, action: #selector(deslikePressed), for: .touchUpInside)
        superlikeButton.addTarget(self, action: #selector(superlikePressed), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
    }
    
    
    func removeCard(card: UIView) {
        card.removeFromSuperview()
        
        self.users = self.users.filter({ (user) -> Bool in
            return user.id != card.tag
        })
    }
    
    func checkMatch(user: User) {
        if user.match {
            print("Wooow")
            
            let matchViewController = MatchViewController()
            matchViewController.user = user
            matchViewController.modalPresentationStyle = .fullScreen
            self.present(matchViewController, animated: true, completion: nil)
        }
    }
    
    func animationCard(rotationAngle: CGFloat, action: Action) {
        if let user = self.users.first{
            for view in self.view.subviews {
                if view.tag == user.id {
                    if let card = view as? CombineCardView {
                        let center: CGPoint
                        var like: Bool
                        switch action {
                        case .deslike:
                            center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            like = false
                        case .superlike:
                            center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                            like = true
                        case .like:
                            center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                            like = true
                        }
                        
                        UIView.animate(withDuration: 0.2, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                            card.deslikeImageView.alpha = like == false ? 1 : 0
                            card.likeImageView.alpha = like == true ? 1 : 0
                        }) { (_) in
                            
                            if like {
                                self.checkMatch(user: user)
                            }
                            
                            self.removeCard(card: card)
                        }
                    }
                }
            }
        }
    }
}
