//
//  UIStateLabel.swift
//  fUber
//
//  Created by user151091 on 1/27/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UIStateLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customStyle()
    }
    
    func customStyle() {
        self.textColor = UIColor.black
        self.font = self.font.withSize(22)
        self.text = " "
        self.textAlignment = .center
        
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 300))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 40))
    }
    
    func stateError(text: String) {
        self.text = text
        self.textColor = UIColor(hue: 0, saturation: 0.8, brightness: 1, alpha: 1)
    }
    
    func stateSuccess(text: String) {
        self.text = text
        self.textColor = UIColor(hue: 7 / 12, saturation: 0.8, brightness: 1, alpha: 1)
    }
    
    func stateInfo(text: String) {
        self.text = text
        self.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.3, alpha: 1)
    }
    
    func stateInfoBlack(text: String) {
        self.text = text
        self.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 1)
    }
}
