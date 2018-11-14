//
//  LogInViewController.swift
//  LVEJO
//
//  Created by Kevin Alonzo on 9/26/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
        
        // Clear the user when this page loads
        
    }
    

    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    // Log in the user
    
    @IBAction func logInPressed(_ sender: Any) {
        
        // Email and password validation
        
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            
        }
    }
    
}




// Kept garbage
/*
 
 
 
 
 
 
 (user, error) in
 
 if error != nil {
 print("error!")
 }
 else {
 print("Log in sucessful!")
 
 // If log in is successful, segue directly to record screen
 self.performSegue(withIdentifier: "goToRecord", sender: self)
 
 }
 */
