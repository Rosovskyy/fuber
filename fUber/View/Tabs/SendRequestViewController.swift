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
    @IBOutlet weak var nameField: UIResizedTextField!
    @IBOutlet weak var descriptionField: UIResizedTextField!
    
    @IBOutlet weak var addressFromField: UIResizedTextField!
    @IBOutlet weak var addressToField: UIResizedTextField!
    @IBOutlet weak var timeField: UIResizedTextField!
    @IBOutlet weak var validTimeField: UIResizedTextField!
    
    weak var currentTimeField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIRoundedColoredButton!
    @IBOutlet weak var datePickerView: UIView!
    
    weak var currentLocationField: UITextField!
    var locationFrom: Request.Location?
    var locationTo: Request.Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField?.delegate = self
        timeField?.delegate = self
        validTimeField?.delegate = self
        addressFromField?.delegate = self
        addressToField?.delegate = self
        descriptionField?.delegate = self

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
        datePickerView.removeFromSuperview()
    }
    
    @IBAction func sendRequest(_ sender: Any) {
        guard
            let name = self.nameField?.text,
            let locationFrom = self.locationFrom,
            let locationTo = self.locationTo,
            let timeString = timeField.text,
            let validTimeString = validTimeField.text else {
                return
        }
        
        guard let time = Request.getDate(string: timeString),
            let validTime =  Request.getDate(string: validTimeString) else {
                return
        }
        
        let description = self.descriptionField?.text
            
    RequestsService.instance.addRequest(Request(userid: nil,
                                                name: name,
                                                time: time,
                                                validTime: validTime,
                                                locationFrom: locationFrom,
                                                locationTo: locationTo,
                                                description: description))

    }
}

extension SendRequestViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == timeField || textField == validTimeField {
            self.currentTimeField = textField
            
            // Add the doneButton and datePicker programatically
            self.view.addSubview(datePickerView)
            self.view.addSubview(doneButton)
            self.view.addSubview(datePicker)
            
            
            if let date = Request.getDate(string: textField.text!) {
                datePicker.date = date
            }
            
            self.view.addConstraints([
                NSLayoutConstraint(item: datePickerView, attribute:  .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: datePickerView, attribute:  .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240),
                NSLayoutConstraint(item: datePickerView, attribute:  .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: datePickerView, attribute:  .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: doneButton, attribute:  .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -4),
                NSLayoutConstraint(item: doneButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: datePicker, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: datePicker, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: doneButton, attribute: .top, multiplier: 1, constant: -4),
                ])
            
            moveDateToTextField()
            
            return false
        }
        if textField == addressFromField || textField == addressToField {
            self.currentLocationField = textField
            
            // show the map location selector
            let mapViewController = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "MapViewNavigationController")
            
            // set the callback function to get data from map
            MapViewController.onDone = { (location: Request.Location) -> Void in
                // change the data and show to user when location selected
                if (self.currentLocationField == self.addressFromField) {
                    self.addressFromField?.text = location.name
                    self.locationFrom = location
                }
                else {
                    self.addressToField?.text = location.name
                    self.locationTo = location
                }
            }
            
            present(mapViewController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
}
