//
//  DataManager.swift
//  Shop
//
//  Created by haris on 27.02.2023.
//

import Foundation

//The Product struct conforms to the Codable protocol, which allows instances of this struct to be encoded and decoded to and from JSON. It contains five properties: name, description, price, image, and id.
struct Product: Codable {
    var name: String
    var description: String
    var price: String
    var image:String
    var id : String
}


class DataManager {
    
    
    
    static  var products = [Product]()
    
    
//    The DataManager class contains two static arrays: products and updatedProductsVir. The Open() method is used to retrieve product data from a remote server using a URL session. The URL used to retrieve the data is "https://63f73b1b833c7c9c607f5f1b.mockapi.io/products". If the data is retrieved successfully, it is decoded using a JSONDecoder object and assigned to the products property of the class.
    static func Open() {
        
        let url = URL(string: "https://63f73b1b833c7c9c607f5f1b.mockapi.io/products")!
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }
            
            do {
                self.products = try JSONDecoder().decode([Product].self, from: data)
            
            } catch {
                print("Error: \(error)")
            }
        }.resume()
        
        
    }

        }



    
    
