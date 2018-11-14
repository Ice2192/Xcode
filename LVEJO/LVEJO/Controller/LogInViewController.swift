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

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var logRegButton: UIButton!
    
    var isLogIn:Bool = true
    var signInValue:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        nameTextField.isHidden = true
        repasswordTextField.isHidden = true
        phoneTextField.isHidden = true
        // Do any additional setup after loading the view.
        // Clear the user when this page loads
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Error pop-up
    func errorAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Selector
    @IBAction func selectorChanger(_ sender: UISegmentedControl) {
        
        // Flip the boolean
        isLogIn = !isLogIn
        
        
        // Check the bool and set the button and labels
        if isLogIn {
            //logInLabel.text = "Log In"
            logRegButton.setTitle("Log In", for: .normal)
            nameTextField.isHidden = true
            repasswordTextField.isHidden = true
            phoneTextField.isHidden = true
        }
        else {
            //logInLabel.text = "Register"
            logRegButton.setTitle("Register", for: .normal)
            nameTextField.isHidden = false
            repasswordTextField.isHidden = false
            phoneTextField.isHidden = false
        }
        
        
    }
    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    // Log in the user
    @IBAction func logInPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            // Check if it's log in or register
            if isLogIn {
                // Sign in user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // Check that user isn't nil
                    if let u = user {
                        // User is found, go to record screen
                        self.performSegue(withIdentifier: "goToRecord", sender: self)
                    }
                    else {
                        // Error: check error and show message
                        self.errorAlert(title: "Error", message: "Incorrect E-mail or Password!")
                    }
                    
                })
            }
            else {
                // Register user with Firebase
                
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    // Check that user isn't nil
                    if self.repasswordTextField.text == self.passwordTextField.text {
                        // User is found, go to record screen
                        self.performSegue(withIdentifier: "goToRecord", sender: self)
                    }
                    else {
                        // Error: check error and show message
                        self.errorAlert(title: "Error", message: "Passwords do not match!")
                    }
                })
            }
        }

        
        
    }
    
    
}
