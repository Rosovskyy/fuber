//
//  LoginViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/22/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum Tabs {
        case Dashboard
        case Middle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Actions
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                
        present(mainTabController, animated: true, completion: nil)
        
    }
    
}

