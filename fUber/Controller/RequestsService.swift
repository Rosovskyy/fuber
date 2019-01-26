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
        let reques = Request(userid: "hello123", time: Date(), validTime: Date().addingTimeInterval(TimeInterval(10000)), locationFrom: "Home", locationTo: "Wallmart")
        getRequests()
        for _ in 1...100 {
            requests.append(reques)
        }
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
                
                print(error.localizedDescription)
                return
            }
            
            if let result1 = (result?.data as? [String: Any])?["result"] as? String {
                print(result1)
            }
            print(result)
            print(result?.data ?? "nil")
            print("end")
        }
    }
    
    static var instance: RequestsService {
        return classInstance
    }
}
