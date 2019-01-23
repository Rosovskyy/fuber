//
//  UnderlinedUITextField.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UnderlinedUITextField: UITextField {

    let borderUnderlined = CALayer()
    let widthUnderlined = CGFloat(1.0)
    borderUnderlined.borderColor = UIColor.lightGrayColor().CGColor
    borderUnderlined.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
    border.borderWidth = widthUnderlined
    self.layer.addSublayer(borderUnderlined)
    self.layer.masksToBounds = true

}
