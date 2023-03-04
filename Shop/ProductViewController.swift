//
//  ProductController.swift
//  Shop
//
//  Created by haris on 28.02.2023.
//
import UIKit

class ProductController: UIViewController {
    var id = 1
    var counter = 1
    var pricetofloat = ""
    var idData = ""
    var titleAlter = "Added Successfully"

    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var numbarP: UILabel!
    @IBOutlet weak var nameR: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataHere = DataManager.products[id]
        nameR.text = dataHere.name
        des.text = dataHere.description
        Price.text = "\(dataHere.price) TL"
        numbarP.text = counter.description
       pricetofloat = dataHere.price
        idData = dataHere.id
        
        
        if let cachedImage = ImageCache.imageCache.object(forKey: (id+1).description as NSString) {
            self.imgeView.image = cachedImage
        }
    }
    
//    The productPlus() method increases the counter by 1 when the "+" button is pressed, updates the numbarP and Price labels accordingly.
    @IBAction func productPlus(_ sender: Any) {
        counter+=1
        numbarP.text = counter.description
        let floatValue = Float(pricetofloat) ?? 0
            Price.text = "\(floatValue*Float(counter)) TL"

    }
    
    
    
//    The productMinus() method decreases the counter by 1 when the "-" button is pressed if the counter is greater than 1, updates the numbarP and Price labels accordingly.
    @IBAction func productMinus(_ sender: Any) {
        if (counter > 0){
            counter-=1
            numbarP.text = counter.description
            let floatValue = Float(pricetofloat) ?? 0
            Price.text = "\(floatValue*Float(counter)) TL"
        }
        
    }
    
    
    
//    he btnPorduct() method adds the selected product to the basket by calling the AddBasket() method of the ProductManager class and shows an alert view with the total amount and total price.
    @IBAction func btnPorduct(_ sender: Any) {
        if counter > 0 {
            if let item = ProductManager.findItemById(id: idData) {
                if  ProductManager.basket[item].counter != counter {
                    ProductManager.basket.remove(at: item)
                    titleAlter = "Update Completed Successfully"
                } else {
                    titleAlter = "You already have it"
                    showAlterView()
                    return}
            }
            
            ProductManager.AddBasket(counter: self.counter, id: self.idData , price: pricetofloat)
            showAlterView()
        }
    }

//    The code creates an alert view with a title and message that includes the total amount and total price. The view is presented with an "OK" button that dismisses the alert view when clicked.
    func showAlterView(){
        let alter = UIAlertController(title: titleAlter, message: "Total Amount: \(self.counter) , Total Price: \(Float(pricetofloat)!*Float(counter)) TL.", preferredStyle: .alert)
        alter.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alter, animated: true,completion: nil)

    }
    }
    

