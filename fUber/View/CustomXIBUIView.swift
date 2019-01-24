//
//  CustomXIBUIView.swift
//  fUber
//
//  Created by user151091 on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class CustomXIBUIView: UIView {
    
    @IBOutlet var view: UIView!
    var xibName: String { return "" }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed(self.xibName, owner: self, options: nil)
        
        guard let unView = self.view else { return }
        self.addSubview(unView)
        unView.frame = self.bounds
        unView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }


}
