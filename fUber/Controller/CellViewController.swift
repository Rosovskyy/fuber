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
    @IBOutlet weak var locationFrom: UIDescriptionItemView!
    @IBOutlet weak var locationTo: UIDescriptionItemView!
    @IBOutlet weak var timeFrom: UIDescriptionItemView!
    @IBOutlet weak var timeValid: UIDescriptionItemView!
    @IBOutlet weak var Description: UIDescriptionItemView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel?.text = request!.name

        locationFrom.setText(key: "Location from", value: request!.locationFrom.name)
        locationTo.setText(key: "Location to", value: request!.locationTo.name)
        timeFrom.setText(key: "Time", value: Request.formatDate(request!.time))
        timeValid.setText(key: "Time valid", value: Request.formatDate(request!.validTime))
        Description.setText(key: "Description", value: request!.description)
        // validTimeTextField.text = Request.formatDate((request?.validTime)!)
    }
    


}
