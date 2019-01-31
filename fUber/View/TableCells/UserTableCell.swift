//
//  UserTableCell.swift
//  fUber
//
//  Created by user151091 on 1/31/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {

    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        key?.text = ""
        value?.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(key: String?, value: String?) {
        self.key?.text = key ?? ""
        self.value?.text = value ?? ""
    }
    
}
