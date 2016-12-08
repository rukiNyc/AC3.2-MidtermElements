//
//  ElementsTableViewController.swift
//  MidTermElementsRuki
//
//  Created by Rukiye Karadeniz on 12/8/16.
//  Copyright © 2016 Rukiye Karadeniz. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {
    var element = [Elements]()
    var endPoint = "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/elements"


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
        ElementsAPIManager.manager.getData(endPoint: endPoint) { (data: Data?) in
            //then call the function for get the array of house
            
            if let arrayofElements = Elements.setData(data: data!){
                DispatchQueue.main.async {
                    self.element = arrayofElements
                    self.tableView.reloadData()
                }
            }
        }

    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return element.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCellIdentifier", for: indexPath)
        
        let convertWeight: String = String( element[indexPath.row].weight)
        
        cell.textLabel?.text = element[indexPath.row].name
        cell.detailTextLabel?.text = ("\(element[indexPath.row].symbol) \(convertWeight) ")
        
        return cell
    }

    

   
    // MARK: - Navigation //

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "elementDetail" {
            let cdtv = segue.destination as? DetailViewController
            let index = self.tableView.indexPath(for: sender as! UITableViewCell)!
            let details = self.element[index.row]
            cdtv?.theElement = details
            
            
        }
    }
   

}
