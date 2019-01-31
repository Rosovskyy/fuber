//
//  UITableView+Extension.swift
//  fUber
//
//  Created by user151091 on 1/31/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(nibName: String) {
        // nib name and reuse identifier should be the same
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
    }

}
