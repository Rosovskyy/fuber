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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name("foober.reloadRequests"), object: nil)
        
        tableView.register(nibName: "RequestsTableCell")
    }
    
    @IBAction func reloadEverything(_ sender: Any) {
        RequestsService.instance.getRequestsDefaultQueue()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCellDummy", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CellViewController {
            destination.request = requestsService.requests[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestsService.requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let request = requestsService.requests[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestsTableCell", for: indexPath) as? RequestsTableCell
        cell?.setData(fromLocation: request.locationFrom.name,
                      toLocation: request.locationTo.name,
                      validTime: request.validTime)
        
        return cell ??  RequestsTableCell()
    }
    
    
}

