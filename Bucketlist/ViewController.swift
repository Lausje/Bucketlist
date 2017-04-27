//
//  ViewController.swift
//  Bucketlist
//
//  Created by Laura van der Stee on 27-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trips : [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            trips = try context.fetch(Trip.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let trip = trips[indexPath.row]
        cell.textLabel?.text = trip.destination
        cell.imageView?.image = UIImage(data: trip.image! as Data)
        return cell
    }
}
