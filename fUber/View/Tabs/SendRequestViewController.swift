//
//  SendRequestViewController.swift
//  fUber
//
//  Created by Andriy Koval on 1/26/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class SendRequestViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var addressFromField: UIResizedTextField!
    @IBOutlet weak var addressToField: UIResizedTextField!
    @IBOutlet weak var timeField: UIResizedTextField!
    @IBOutlet weak var validTimeField: UIResizedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func sendRequest(_ sender: Any) {
        guard let locationFrom = addressFromField.text,
            let locationTo = addressToField.text,
            let time = timeField.text,
            let validTime = validTimeField.text else {
                return
        }
        
        do {
            guard let time = try Request.getDate(string: time),
                let validTime = try Request.getDate(string: validTime) else {
                    return
            }
            
            RequestsService.instance.addRequest(Request(userid: nil, time: time, validTime: validTime, locationFrom: locationFrom, locationTo: locationTo))
        } catch {}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
