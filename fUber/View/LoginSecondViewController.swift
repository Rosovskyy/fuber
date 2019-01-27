//
//  LoginSecondViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginSecondViewController: UIViewController {
    let loginStackDispatchQueue = DispatchQueue(label: "Login", qos: .userInitiated)
    
    // MARK: IBOutlets
    
    @IBOutlet weak var stateLabel: UIStateLabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: Actions
    
    func onData() {
        guard let email = emailTextField?.text, let password = passwordTextField?.text else {
            return
        }
        
        if email.isEmpty {
            stateLabel.stateError(text: "Empty email field")
            return
        }
        if password.isEmpty {
            stateLabel.stateError(text: "Empty password field")
            return
        }
        
        stateLabel.stateInfo(text: "Loading...")
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let firebaseError = error {
                DispatchQueue.main.async {
                    self.stateLabel.stateError(text: "Error. Check credentials")
                }
                // print(firebaseError.localizedDescription)
                return
            }
            
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
            
            DispatchQueue.main.async {
                self.stateLabel.stateSuccess(text: "Success!")
                self.present(mainTabController, animated: true, completion: nil)
            }
        });
    }
    
    
    @IBAction func logginTapped(_ sender: Any) {
        onData()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}

extension LoginSecondViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        stateLabel.stateInfo(text: " ")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            passwordTextField.becomeFirstResponder()
        }
        else if (textField == passwordTextField) {
            onData()
        }
        
        textField.resignFirstResponder()
        
        return true
    }
}
