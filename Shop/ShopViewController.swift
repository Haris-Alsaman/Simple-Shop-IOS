//
//  ShopViewController.swift
//  Shop
//
//  Created by haris on 27.02.2023.
//

import UIKit
// ShopViewController class conforms to the UITableViewDelegate and UITableViewDataSource protocols

@available(iOS 13.0, *)
class ShopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    
    let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializes the table view's delegate and data source.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Check if there are any products in the DataManager's products array
        if DataManager.products.count == 0 {
            
            // If there are no products, display an error message
            DataManager.Open()
            tableView.isHidden = true
            
            // Create an image view and set it to an image that indicates an error
            let imgErrorPhoto = UIImageView(frame: CGRect(x: 50, y: 100, width: self.view.frame.width - 100, height: 200))
            imgErrorPhoto.image = UIImage(systemName: "icloud.slash")
            imgErrorPhoto.tintColor = UIColor.white
            self.view.addSubview(imgErrorPhoto)
            
            // Create a label and set its text to a message that indicates there is no data to display
            let lblMsg = UILabel(frame: CGRect(x: imgErrorPhoto.frame.minX, y: imgErrorPhoto.frame.maxY + 15, width: imgErrorPhoto.frame.width, height: 30))
            lblMsg.text = "No Data to Display"
            lblMsg.textAlignment = .center
            self.view.addSubview(lblMsg)
            
        }
        
        // Set the tint color of the refresh control to brown and add an action that will be triggered when the user pulls down to refresh
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
    }
    
    // Function that gets called when the user pulls down to refresh the table view
  @objc func getData(){
      
      // Append a new product to the DataManager's products array and reload the table view to display the new data
//      to experiment
      
      DataManager.products.append(Product(name: "refreshControl", description: " reloadData", price: "1.0", image: "https://loremflickr.com/640/480/food", id: (DataManager.products.count+1).description))
        refreshControl.endRefreshing()
        tableView.reloadData()
      
    }
    
    // Action that gets called when the "Show Basket" button is pressed
    @IBAction func btnShowBasket(_ sender: Any) {
        
        // Check if the basket is not empty and if it is not, navigate to the basket view controller
        if !ProductManager.basket.isEmpty {
            let SecondUi = self.storyboard?.instantiateViewController(identifier: "basket")
            navigationController?.pushViewController(SecondUi!, animated: true)
            
        }else{
            
            let alter = UIAlertController(title: "Upss!", message: "There is no item in basket", preferredStyle: .alert)
            alter.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alter, animated: true,completion: nil)
        }
    }
    
    // Delegate method that returns the number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return DataManager.products.count
           
       }
    
    // Delegate method that returns the cell for a particular row
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! TableViewCell
           let data = DataManager.products[indexPath.row]
           cell.setupCell(name: data.name, price: data.price, description: data.description, imgee: data.image , id: data.id)
           return cell
       }


//    tableView(_:didSelectRowAt:) is a method of the UITableViewDelegate protocol that is called when the user selects a row in the table view. It instantiates a ProductController view controller and sets its id property to the index of the selected row. It then presents the ProductController view controller modally on the screen.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SecondUi = self.storyboard?.instantiateViewController(withIdentifier:"eklee") as! ProductController
        SecondUi.id = indexPath.row
        present(SecondUi, animated: true , completion: nil)

    }
    

}
