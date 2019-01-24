//
//  LoginViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/22/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GREEN_THEME
    }

    // MARK: Actions
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
                
        present(mainTabController, animated: true, completion: nil)
        
    }
    
}

