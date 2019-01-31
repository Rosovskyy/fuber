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
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: [String:Any]?;
    var userData = ["name", "number", "email"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        signOutButton.layer.cornerRadius = 20
        signOutButton.clipsToBounds = true
        changeImageButton.layer.cornerRadius = 20
        changeImageButton.clipsToBounds = true
    
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(nibName: "UserTableCell")
        
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
                
                self.user = dict
                self.reloadTableView()
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
    
    func reloadTableView() {
        tableView.reloadData()
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableCell", for: indexPath) as? UserTableCell ?? UserTableCell()
    
        let i = indexPath.row
        let key = userData[i]
        cell.setData(key: userData[i], value: user?[key] as? String)
 
        return cell
    }
}
