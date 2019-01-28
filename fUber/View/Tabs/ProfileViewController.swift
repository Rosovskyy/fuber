//
//  ProfileViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/25/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        signOutButton.layer.cornerRadius = 20
        signOutButton.clipsToBounds = true
        changeImageButton.layer.cornerRadius = 20
        changeImageButton.clipsToBounds = true
        
        setDataAboutUser()
    }
    
    func setDataAboutUser() {
        if Auth.auth().currentUser != nil {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot)
                in
                guard let dict = snapshot.value as? [String: Any] else {
                    return
                }
                
                let user = CurrentUser(uid: uid, dictionary: dict)
                self.nameLabel.text = "Name: " + user.name
                self.emailLabel.text = "Email: " + user.email
                self.phoneLabel.text = "Phone number: " + user.number
                
            }) { (err) in
                print(err)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: Actions:
    
    @IBAction func changeProfileImageTapped(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        try? Auth.auth().signOut()
        performSegue(withIdentifier: "profileSignOutDummy", sender: nil)
    }
    
    
}
