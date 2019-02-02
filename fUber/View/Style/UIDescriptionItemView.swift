//
//  UIDescriptionItemView.swift
//  fUber
//
//  Created by user151091 on 2/2/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UIDescriptionItemView: UIView {
    var key: UILabel?
    var value: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customStyle()
    }
    
    func customStyle() {
        key = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        key?.textAlignment = .left
        key?.text = ""
        key?.font = key?.font.withSize(15)
        value = UILabel(frame: CGRect(x: 110, y: 10, width: 170, height: 20))
        value?.textAlignment = .left
        value?.text = ""
        value?.font = value?.font.withSize(15)
        
        key?.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        value?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.addSubview(key!)
        self.addSubview(value!)
        
        self.addConstraints([NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)])
    }
    
    func setText(key: String?, value: String?) {
        self.key?.text = key ?? ""
        self.value?.text = value ?? ""
    }

}
