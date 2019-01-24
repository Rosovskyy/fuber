//
//  RegistrationViewController.swift
//  fUber
//
//  Created by Andriy Koval on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 20
        returnButton.layer.masksToBounds = true
        returnButton.layer.cornerRadius = 20

    }
    
    @IBAction func returnFromSignUp(_ sender: Any) {
        performSegue(withIdentifier: "returnSegue", sender: nil)
    }
}
