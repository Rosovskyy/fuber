//
//  RegistrationViewController.swift
//  fUber
//
//  Created by Andriy Koval on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class RegistrationViewController: UIViewController {
    
    // MARK: Properties
    let ref = Database.database().reference()

    // MARK: IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func signUpTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text, let number = numberTextField.text else {
            print("Form is not valid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: .alert)
    
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
    
                self.present(alertController, animated: true, completion: nil)
                return
            }

            
            let ref = Database.database().reference()
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            let usersReference = ref.child("users").child(uid)
            let values = ["email": email, "name": name, "number": number, "password": password]
            usersReference.setValue(values)
            
            self.performSegue(withIdentifier: "returnSegue", sender: nil)
        }
    }
    
    @IBAction func returnFromSignUp(_ sender: Any) {
        performSegue(withIdentifier: "returnSegue", sender: nil)
    }
}
