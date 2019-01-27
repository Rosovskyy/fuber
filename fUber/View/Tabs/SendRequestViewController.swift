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
    
    weak var currentTimeField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIRoundedColoredButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeField?.delegate = self
        validTimeField?.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    
    func moveDateToTextField() {
        guard let timeField = self.currentTimeField else {
            return
        }
        
        let date = datePicker.date
        let dateString = Request.formatDate(date)
        timeField.text! = dateString
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        moveDateToTextField()
    }
    
    @IBAction func done(_ sender: Any) {
        doneButton.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    @IBAction func sendRequest(_ sender: Any) {
        guard let locationFrom = addressFromField.text,
            let locationTo = addressToField.text,
            let timeString = timeField.text,
            let validTimeString = validTimeField.text else {
                return
        }
        
        guard let time = Request.getDate(string: timeString),
            let validTime =  Request.getDate(string: validTimeString) else {
                return
        }
            
    RequestsService.instance.addRequest(Request(userid: nil, time: time, validTime: validTime, locationFrom: locationFrom, locationTo: locationTo))

    }
}

extension SendRequestViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.currentTimeField = textField
        
        self.view.addSubview(doneButton)
        self.view.addSubview(datePicker)
        
        if let date = Request.getDate(string: textField.text!) {
            datePicker.date = date
        }
        
        self.view.addConstraints([
            NSLayoutConstraint(item: doneButton, attribute:  .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -4),
            NSLayoutConstraint(item: doneButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: datePicker, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: datePicker, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: doneButton, attribute: .top, multiplier: 1, constant: -4),
            ])
        
        moveDateToTextField()
        
        return false
    }
}
