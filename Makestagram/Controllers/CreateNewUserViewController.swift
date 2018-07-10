//
//  CreateNewUserViewController.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/10/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateNewUserViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
        let username = usernameTextField.text,
        !username.isEmpty else {return}
        
        UserService.create(firUser, username: username) { (User?) in
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
