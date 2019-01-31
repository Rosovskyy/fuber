//
//  ChangeProfileViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/31/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ChangeProfileViewController: UIViewController {
    
    // MARK: Properties
    var data: String = ""
    
    // MARK: IBOutlets
    @IBOutlet weak var justALabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var changeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        justALabel.text = data.capitalizingFirstLetter()
        changeButton.setTitle("Change your \(data)", for: .normal)
        changeTextField.underlined()
    }
    
    @IBAction func changeTapped(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            Database.database().reference().child("users").child(uid).child(data).setValue(changeTextField.text)
            
                performSegue(withIdentifier: "ChangeToProfileDummy", sender: nil)
        }
    }
    

}

