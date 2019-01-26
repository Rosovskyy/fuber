//
//  RequestsTableTableVC.swift
//  fUber
//
//  Created by user151091 on 1/23/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class RequestsTableVC: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!
    
    let requestsService = RequestsService.instance
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("foober.reloadRequests"), object: nil)
        
        let nib = UINib(nibName: "RequestsTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RequestsTableCell")
        
    }
    
    @objc func reloadTableView(_ notification: Notification) {
        tableView.reloadData()
    }
    
}

extension RequestsTableVC: UITableViewDelegate {
    
}

extension RequestsTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestsService.requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let request = requestsService.requests[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestsTableCell", for: indexPath) as? RequestsTableCell
        cell?.setData(fromLocation: request.locationFrom, toLocation: request.locationTo, validTime: request.validTime)
        
        return cell ??  RequestsTableCell()
    }
    
    
}

