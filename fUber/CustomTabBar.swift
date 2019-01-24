//
//  CustomTabBar.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/22/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    // MARK: IBOutlets
    
    var tabBarItem = UITabBarItem()

    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white]?, for: <#T##UIControl.State#>)
        
        // Do any additional setup after loading the view.
    }
    

}
