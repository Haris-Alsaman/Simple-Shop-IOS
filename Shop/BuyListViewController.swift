//
//  BuyListViewController.swift
//  Shop
//
//  Created by haris on 3.03.2023.
//

import UIKit
@available(iOS 13.0, *)
class BuyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "haris") as! BuyListTableViewCell
//        let data = products[indexPath.row]
        cell.setupCell(name: "haris")
        
        return cell
    }
    

    



}
