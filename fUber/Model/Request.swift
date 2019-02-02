//
//  Request.swift
//  fUber
//
//  Created by user151091 on 1/24/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import Foundation

class Request {
    var userid: String?;
    var name: String
    var time: Date
    var validTime: Date
    var locationFrom: Location
    var locationTo: Location
    var description: String
    var finished: Bool = false
    
    init(userid: String?, name: String, time: Date, validTime: Date, locationFrom: Location, locationTo: Location, description: String?) {
        self.userid = userid
        self.name = name
        self.time = time
        self.validTime = validTime
        self.locationFrom = locationFrom
        self.locationTo = locationTo
        self.description = description ?? ""
    }
    
    static let dateFormatter = DateFormatter()
    static func formatDate(_ date: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    static func getDate(string: String) -> Date?  {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: string)
    }
    
    class Location {
        var lat: Double;
        var lon: Double;
        var name: String;
        
        init(lat: Double, lon: Double, name: String?) {
            self.lat = lat
            self.lon = lon
            self.name = name ?? ""
        }
        
        func toDict() -> [String:String] {
            return ["lat": "\(lat)", "lon": "\(lon)", "name": name]
        }
    }
    
    func toDict() -> [String: Any] {
        return [
            "name": name,
            "userid": userid ?? "nil",
            "time": Request.formatDate(time),
            "validTime": Request.formatDate(validTime),
            "locationFrom": locationFrom.toDict(),
            "locationTo": locationTo.toDict(),
            "description": description
        ]
    }
}
