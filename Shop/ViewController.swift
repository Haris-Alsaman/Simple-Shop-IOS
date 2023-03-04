//
//  ViewController.swift
//  Shop
///Users/haris/Desktop/projecs/Shop/Shop/ViewContro.swift
//  Created by haris on 25.02.2023.
//

import UIKit


@available(iOS 13.0, *)
class ViewController: UIViewController {
    

    
    @IBOutlet weak var Basket: UIButton!
    @IBOutlet weak var shop: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        The Open() method is used to retrieve product data from a remote server using a URL session.
        DataManager.Open()

        }

//    The btnBasket() method is an action method that is called when the Basket button is tapped. It checks if the basket property of the ProductManager class is not empty, and if so, creates a new instance of a view controller with the identifier "basket" and pushes it onto the navigation controller's stack with animation.
    @IBAction func btnBasket(_ sender: Any) {
        if !ProductManager.basket.isEmpty {
            let SecondUi = self.storyboard?.instantiateViewController(identifier: "basket")
            navigationController?.pushViewController(SecondUi!, animated: true)
            
        }
    }
    

    
    
}
