//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/9/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import FirebaseUI
import FirebaseDatabase
import FirebaseAuth

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI() else {return}
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FirebaseAuth.User?, error: Error?) {
        
        if let error = error {
            assertionFailure("error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = user else {return}
        let userRef = Database.database().reference().child("users").child(user.uid)
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User(snapshot: snapshot) {
                print("this is an existing user \(user.username)")
            }
            else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
    }
}

