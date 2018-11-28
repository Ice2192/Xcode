//
//  RegisterViewController.swift
//  LVEJO
//
//  Created by Kevin Alonzo on 9/26/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // Github test
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repassTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    @IBOutlet weak var passNoMatch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passNoMatch.isHidden = true
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        // Set up new user in Firebase
        
        if (repassTextfield.text == passwordTextfield.text){        // Check if password retyped match
            
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                
                (user, error) in
                
                if error != nil {
                    print(error!)
                }
                    
                else {
                    print("Registration Successful!")
                    self.performSegue(withIdentifier: "goToRecord", sender: self)
                }
            }
        }
        else {
            
            passNoMatch.isHidden = false
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
