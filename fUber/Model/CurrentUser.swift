//
//  CurrentUser.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/28/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import Foundation


class CurrentUser {
    let uid: String
    let name: String
    let number: String
    let email: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.number = dictionary["number"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
