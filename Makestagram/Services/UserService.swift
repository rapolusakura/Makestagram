//
//  UserService.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/10/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttribute = ["username" : username]
        let userRef = Database.database().reference().child("users").child(firUser.uid)
        
        userRef.setValue(userAttribute) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                return completion(user)
            })
        }
    }
    
    
    
}
