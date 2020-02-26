//
//  UserService.swift
//  Tinder
//
//  Created by claudiocarvalho on 24/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    let users: [User] = [
        User(id: 101, name: "Stephani Keller", age: 19, match: true, phrase: "Last to match calls", photo: "pessoa-1"),
        User(id: 102, name: "jhennifer Sellin", age: 25, match: false, phrase: "Did you accidentally like it?", photo: "pessoa-2"),
        User(id: 103, name: "Sandra Bullok", age: 24, match: false, phrase: "I think we combine", photo: "pessoa-3"),
        User(id: 104, name: "Anna Huston", age: 22, match: true, phrase: "I don't drink, I don't smoke and I don't like ballads", photo: "pessoa-4"),
        User(id: 105, name: "Laura Oliveira", age: 26, match: true, phrase: "Do you want to know more about me?", photo: "pessoa-5"),
        User(id: 106, name: "Silva Paz", age: 19, match: false, phrase: "If you don't talk or like", photo: "pessoa-6"),
        User(id: 107, name: "Debora Lima", age: 25, match: false, phrase: "In search of new friendships", photo: "pessoa-7"),
        User(id: 108, name: "Sandra Souza", age: 24, match: true, phrase: "Shirtless photos don't impress me", photo: "pessoa-8"),
        User(id: 109, name: "Tah Beatriz", age: 22, match: false, phrase: "Hi apparently we combine", photo: "pessoa-9"),
        User(id: 110, name: "Laura Oliveira", age: 26, match: true, phrase: "Looking for a good chat", photo: "pessoa-10"),
        User(id: 111, name: "Sabrina Santos", age: 21, match: false, phrase: "Those who describe themselves are limited", photo: "pessoa-11"),
        User(id: 112, name: "Amelia Margaret", age: 30, match: false, phrase: "I don't want anything casual", photo: "pessoa-12"),
        User(id: 113, name: "Laura Komako", age: 26, match: true, phrase: "Good humor is key", photo: "pessoa-13"),
        User(id: 114, name: "Rosa Oliveira", age: 25, match: false, phrase: "I can't describe myself", photo: "pessoa-14"),
        User(id: 115, name: "Nadia Joana", age: 20, match: false, phrase: "Want to know more? just like", photo: "pessoa-15"),
        User(id: 116, name: "Mary Dandara", age: 20, match: false, phrase: "I have an open relationship", photo: "pessoa-16"),
        User(id: 117, name: "Anita Eleanor", age: 23, match: false, phrase: "Too beautiful to be true", photo: "pessoa-17"),
        User(id: 118, name: "Helen Aung San", age: 24, match: true, phrase: "I hope you are open minded", photo: "pessoa-18"),
        User(id: 119, name: "Laura Nelle", age: 18, match: false, phrase: "I'm here to make new friends", photo: "pessoa-19"),
        User(id: 120, name: "Maria Virginia", age: 18, match: false, phrase: "I love ballad", photo: "pessoa-20")
    ]
    
    func fetchUsers(completion: @escaping ([User]?, Error?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            completion(self.users, nil)
        }
    }
}
