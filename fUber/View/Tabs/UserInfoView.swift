//
//  UserInfoView.swift
//  fUber
//
//  Created by user151091 on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import Firebase

class UserInfoView: CustomXIBUIView {
    @IBOutlet weak var imageProfile: UIImageView!
    override var xibName: String { return "UserInfoView" }
    
    override func commonInit() {
        commonInit()
        
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.clipsToBounds = true
    }    
}
