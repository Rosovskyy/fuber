//
//  String+Extentsion.swift
//  fUber
//
//  Created by Serhiy Rosovskyy on 1/31/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import Foundation


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
