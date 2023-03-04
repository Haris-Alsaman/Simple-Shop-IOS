//
//  TableViewCell.swift
//  Shop
//
//  Created by haris on 27.02.2023.
//

import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet weak var lapPrice: UILabel!
       @IBOutlet weak var lapDes: UILabel!
       @IBOutlet weak var lapName: UILabel!
       @IBOutlet weak var imgeView: UIImageView!
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
    
//    imageCache is a method that fetches an image from a URL and caches it using an NSCache object. It      takes in an imgUrl string and an id string as parameters.
    func imageCache (imgUrl: String,id:String ){
        var expandedURL : String!
        let urlGlobal = URL(string: imgUrl)!
        URLSession.shared.dataTask(with: urlGlobal) { (data, urlResponse, error) in
            expandedURL = urlResponse?.url?.absoluteString
            if let url = URL(string: expandedURL) {
                if let cachedImage = ImageCache.imageCache.object(forKey: id as NSString) {
                    DispatchQueue.main.async {
                        self.imgeView.image = cachedImage
                    }
                } else {
                    DispatchQueue.global(qos: .userInitiated).async {
                        do {
                            let data = try Data(contentsOf: url)
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                self.imgeView.image = image
                                ImageCache.imageCache.setObject(image!, forKey: id as NSString)
                            }
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }.resume()
    }
    
//    setupCell is a method that sets up the cell with data. It takes in the name, price, description, image URL, and ID of a product, and sets the corresponding labels and image view using the imageCache method.
    func setupCell(name : String , price: String ,description : String , imgee : String,id :String){
           lapName.text = name
           lapDes.text = description
           lapPrice.text = "\(price) TL"
           imageCache(imgUrl: imgee,id :id)
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

       }

}
