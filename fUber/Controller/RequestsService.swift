//
//  RequestsService.swift
//  fUber
//
//  Created by user151091 on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class RequestsService {
    var requests = [Request]()
    static private var classInstance = RequestsService()
    
    private init() {
        let reques = Request(userid: "hello123", time: Date(), validTime: Date().addingTimeInterval(TimeInterval(10000)), locationFrom: "Home", locationTo: "Wallmart")
        requests.append(reques)
    }
    
    static var instance: RequestsService {
        return classInstance
    }
}
