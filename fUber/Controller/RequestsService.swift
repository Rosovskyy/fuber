//
//  RequestsService.swift
//  fUber
//
//  Created by user151091 on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit
import FirebaseFunctions

class RequestsService {
    lazy var functions = Functions.functions()
    
    var requests = [Request]()
    static private var classInstance = RequestsService()
    
    private init() {
        getRequestsDefaultQueue()
    }
    
    // [START function_add_message]
    func addRequest(_ request: Request) {
        
        print("Adding request")
        
        let data = request.toDict()
        functions.httpsCallable("addRequest").call(data) { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                }

                print(error.localizedDescription)
                return
            }
            
            if let success = (result?.data as? [String: Any])?["success"] as? Bool {
                print("Add Request success:", success)
            }
        }
        // [END function_add_message]
    }
    
    func getRequests() {
        print("Getting requests")
        
        functions.httpsCallable("getRequests").call() { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                }
                
                print("Error", error.localizedDescription)
                return
            }
            
            if let success = (result?.data as? [String: Any])?["success"] as? Bool {
                print("Get Requests success:", success)
            }
            
            
            if let requests = (result?.data as? [String: Any])?["requests"] as? [Any] {
                self.requests = []
                for request in requests {
                    guard let requestDict = request as? [String: Any] else {
                        continue
                    }
                    
                    let uid = (requestDict["user"] as? [String: Any])?["uid"] as! String
                    
                    let name = requestDict["name"] as! String
                    let description = requestDict["description"] as? String
                    
                    let time = Request.getDate(string: requestDict["time"] as! String)!
                    let validTime = Request.getDate(string: requestDict["validTime"] as! String)!
                    let locationFromDict = requestDict["locationFrom"] as! [String: Any]
                    let locationToDict = requestDict["locationTo"] as! [String: Any]
                    
                    let locationFrom = Request.Location(lat: Double(locationFromDict["lat"] as! String)!,
                                                        lon: Double(locationFromDict["lon"] as! String)!,
                                                        name: locationFromDict["name"] as? String)
                    let locationTo = Request.Location(lat: Double(locationToDict["lat"] as! String)!,
                                                        lon: Double(locationToDict["lon"] as! String)!,
                                                        name: locationToDict["name"] as? String)
                    
                    let newRequest = Request(userid: uid, name: name, time: time, validTime: validTime, locationFrom: locationFrom, locationTo: locationTo, description: description)
                    self.requests.append(newRequest)
                }
                
                NotificationCenter.default.post(name: Notification.Name("foober.reloadRequests"), object: nil)
            }
        }
    }
    
    func getRequestsDefaultQueue(deadline: DispatchTime = .now()) {
        DispatchQueue(label: "Get requests", qos: .default).asyncAfter(deadline: deadline) {
            self.getRequests()
        }
    }

    static var instance: RequestsService {
        return classInstance
    }
}
