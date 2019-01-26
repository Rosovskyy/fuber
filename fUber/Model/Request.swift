//
//  Request.swift
//  fUber
//
//  Created by user151091 on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import Foundation

class Request {
    var userid: String;
    var time: Date;
    var validTime: Date;
    var locationFrom: String;
    var locationTo: String;
    var finished: Bool = false;
    
    init(userid: String, time: Date, validTime: Date, locationFrom: String, locationTo: String) {
        self.userid = userid
        self.time = time
        self.validTime = validTime
        self.locationFrom = locationFrom
        self.locationTo = locationTo
    }
    
    static let dateFormatter = DateFormatter()
    static func formatDate(_ date: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    static func getDate(string: String) -> Date {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: string)!
    }
    
    class Location {
        var lat: Double;
        var lon: Double;
        
        init(lat: Double, lon: Double) {
            self.lat = lat
            self.lon = lon
        }
    }
    
    func toDict() -> [String: String] {
        return [
            "userid": userid,
            "time": Request.formatDate(time),
            "validTime": Request.formatDate(validTime),
            "locationFrom": locationFrom,
            "locationTo": locationTo
        ]
    }
}
