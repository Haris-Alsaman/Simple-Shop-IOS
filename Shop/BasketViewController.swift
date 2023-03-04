//
//  BasketViewController.swift
//  Shop
//
//  Created by haris on 28.02.2023.
//

import UIKit

class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    
    @IBOutlet weak var laptotal: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
//    This function is called when the user taps on the "Check Out" button. It calls a function called  showAlterView() to display an alert view with the total price of the items in the basket.
    
    @IBAction func btnCheckOut(_ sender: Any) {
        
        showAlterView()
        ProductManager.basket.removeAll()
        
//        laptotal.text = "Total Price: 0 "
//        tableView.reloadData()
        
        
    }
    
//    This function creates an alert view with a title and message that displays the total price of the items in    the basket, and presents it to the user.
    
    func showAlterView(){

        let alertController = UIAlertController(title: "Successfully", message: "Total Price: \(ProductManager.totalPrice()) TL.", preferredStyle: .alert)

        // Add an OK action to the alert
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // When the user taps "OK", dismiss the alert and return to the previous view controller
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)

        // Present the alert view controller
        self.present(alertController, animated: true, completion: nil)
        
    }
//    This function is called by the table view to get the number of rows to display. It returns the number of      items in the basket.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductManager.basket.count

     }
    
    
//    This function is called by the table view to get the cell to display at a particular row. It dequeues a       reusable cell with the identifier "basketCell", gets the data for the cell at that row from the               ProductManager, gets the corresponding product data from the DataManager, sets up the cell with the name,     price, and quantity of the item, and returns the cell. It also updates the label that displays the total      price of the items in the basket.
    var i: Float = 0
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell") as! BasketTableViewCell
         let data = ProductManager.basket[indexPath.row]
         let dataItem = DataManager.products[(Int(data.id) ?? 0)-1 ]
         laptotal.text = "Total Price: \(ProductManager.totalPrice()) TL"
         cell.setupCell(name: dataItem.name, price: dataItem.price, id: dataItem.id, number: data.counter)
         return cell
     }
  
}
