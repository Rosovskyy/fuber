//
//  ProfileViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.clipsToBounds = true
    }
    
    // MARK: Actions
    
    @IBAction func signOutTapped(_ sender: Any) {
        try? Auth.auth().signOut()
        performSegue(withIdentifier: "profileSignOutDummy", sender: nil)
    }
    
}
