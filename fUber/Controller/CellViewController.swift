//
//  CellViewController.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/30/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {
    
    // MARK: Properties
    var request: Request?
    
    // MARK: IBOutlets
    @IBOutlet weak var fromTextLabel: UILabel!
    @IBOutlet weak var toTextLabel: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    @IBOutlet weak var validTimeTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fromTextLabel.text = request?.locationFrom
        toTextLabel.text = request?.locationTo
        timeTextField.text = Request.formatDate((request?.time)!)
        // validTimeTextField.text = Request.formatDate((request?.validTime)!)
    }
    


}
