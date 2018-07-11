//
//  User.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/10/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    let uid: String
    let username: String
    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else {
            fatalError("user doesnt exist")
        }
        return currentUser
    }
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Constants.UserDefault.currentUser)
            }
        }
        _current = user
    }
    
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot){
        guard let userDictionary = snapshot.value as? [String: Any],
            let username = userDictionary["username"] as? String
            else {return nil}
        //having the comma ensures that both the userDictionary and the username must exist otherwise the initializer will fail/return nil
        
        self.uid = snapshot.key
        self.username = username
    }
}
