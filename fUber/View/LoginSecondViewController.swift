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
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: Actions
    
    @IBAction func logginTapped(_ sender: Any) {
        onData()
    }
    
    func onData() {
        guard let email = emailTextField?.text, let password = passwordTextField?.text else {
            return
        }
        
    
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let firebaseError = error {
                print(firebaseError.localizedDescription)
                    return
            }
                
            let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
                
            DispatchQueue.main.async {
                self.present(mainTabController, animated: true, completion: nil)
            }
        });
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}

extension LoginSecondViewController: UITextFieldDelegate {
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
