//
//  RequestsTableCell.swift
//  fUber
//
//  Created by user151091 on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class RequestsTableCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fromLocationLabel: UILabel!
    @IBOutlet weak var toLocationLabel: UILabel!
    @IBOutlet weak var validTillLabel: UILabel!
    @IBOutlet weak var validTillDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        fromLocationLabel.layer.masksToBounds = true
        toLocationLabel.layer.masksToBounds = true
        validTillLabel.layer.masksToBounds = true
        validTillDateLabel.layer.masksToBounds = true
        fromLocationLabel.layer.cornerRadius = 10.5
        toLocationLabel.layer.cornerRadius = 10.5
        validTillLabel.layer.cornerRadius = 10.5
        validTillDateLabel.layer.cornerRadius = 10.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(name: String, fromLocation: String, toLocation: String, validTime: Date) {
        nameLabel!.text = name
        fromLocationLabel!.text = "  \(fromLocation)  "
        toLocationLabel!.text = "  \(toLocation)  "
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: validTime)
        validTillLabel!.text = "  \(timeString)  "
        dateFormatter.dateFormat = "yyyy:MM:dd"
        let dateString = dateFormatter.string(from: validTime)
        validTillDateLabel!.text = "  \(dateString)  "
    }
    
}
