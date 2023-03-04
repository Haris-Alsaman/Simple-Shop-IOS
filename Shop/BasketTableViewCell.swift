//
//  BasketTableViewCell.swift
//  Shop
//
//  Created by haris on 28.02.2023.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    var totalPrice : Float = 0.0
    @IBOutlet weak var basketImg: UIImageView!
    @IBOutlet weak var basketPrice: UILabel!
    @IBOutlet weak var basketNumber: UILabel!
    @IBOutlet weak var basketName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
//    Inside the method, the basketName, basketPrice, and basketNumber labels are set to the appropriate            values based on the name, price, and number parameters.
  
    func setupCell(name : String , price: String ,id : String , number : Int ){
        basketName.text = name
        let floatPrice = ((Float(price) ?? 1) * Float(number))
        basketPrice.text = "\(floatPrice.description) TL"
        basketNumber.text = "Amount: \(number)"
        
        
//        The id parameter is used to try to fetch the corresponding image for the product from the application's       image cache using the ImageCache singleton object. If the image is found in the cache, it is set to the       basketImg property. Otherwise, a message is printed to the console indicating that the image is not           found in the cache.
        if let cachedImage = ImageCache.imageCache.object(forKey: id as NSString) {
            
            self.basketImg.image = cachedImage
            
        }else{
            
          print("There is no img")
            
        }
        
    }
    

}
