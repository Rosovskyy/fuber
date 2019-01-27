//
//  UIResizedTextField.swift
//  fUber
//
//  Created by user151091 on 1/27/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UIResizedTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customStyle()
    }
    
    func customStyle() {
        self.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.font = self.font!.withSize(20)
        self.clearButtonMode = .whileEditing

        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 300))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 40))
    }

}
