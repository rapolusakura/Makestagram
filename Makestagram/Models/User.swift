//
//  User.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/10/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    let uid: String
    let username: String
    
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
