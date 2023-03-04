//
//  ViewContro.swift
//  Shop
//
//  Created by haris on 26.02.2023.
//

import UIKit

class ViewContro: UIViewController {
    
    func imge(img: UIImageView,urlString: String){
//        let urlString = "https://loremflickr.com/640/480/food"
        guard let url = URL(string: urlString) else { return }
        
        // Create a URL session
        let session = URLSession.shared
        
        // Create a data task to download the image
        let task = session.dataTask(with: url) { (data, response, error) in
            // Check for errors and unwrapped the downloaded data
            guard error == nil, let data = data else { return }
            
            // Create an UIImage object from the downloaded data
            guard let image = UIImage(data: data) else { return }
            
            // Update the UIImageView on the main thread
//            DispatchQueue.main.async {
            img.image = image
//            }
        }
        
        // Start the data task
        task.resume()
    }
    
    
    @IBAction func but(_ sender: Any) {
    }
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imge(img: imageView!,urlString:"https://loremflickr.com/640/480/food")
        imge(img: img3!,urlString:"https://loremflickr.com/640/480/food")
        imge(img: img2!,urlString:"https://loremflickr.com/640/480/food")
        
        
        
    }
    

    @IBAction func butAction(_ sender: Any) {
        
        
        struct Product: Codable {
            let name: String
            let description: String
            let price: String
            let image: String
            let id : String
        }
        
        let url = URL(string: "https://63f73b1b833c7c9c607f5f1b.mockapi.io/products")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                print(products)
                print("Name: \(products.count) and Age: \( products[5].description)")
                // يمكن استخدام المصفوفة products هنا لعرض المنتجات في التطبيق
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
    
}
