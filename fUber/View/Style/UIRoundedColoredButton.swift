//
//  UIRoundedColoredButton.swift
//  fUber
//
//  Created by user151091 on 1/27/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UIRoundedColoredButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customStyle()
    }
    
    func customStyle() {
        self.backgroundColor = UIColor(red: 36 / 255, green: 145 / 255, blue: 92 / 255, alpha: 1)
        self.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
        self.titleLabel!.font = self.titleLabel?.font.withSize(22)
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 140))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 40))
    }
}
