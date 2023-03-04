//
//  ProductManager.swift
//  Shop
//
//  Created by haris on 28.02.2023.
//

import Foundation

//The Basket struct contains three properties: counter, id, and price. These properties hold information about a product that has been added to the basket.
struct Basket{
    var  counter : Int
    var id : String
    var price : String
    
    }


class ProductManager{
    
    
    static var basket = [Basket]()
    
//    The AddBasket() method is used to add a new item to the basket. It takes three arguments: counter, id, and price, which represent the quantity, ID, and price of the product being added. The method creates a new instance of the Basket struct using the arguments passed in and appends it to the basket array.
    
    static func AddBasket (counter : Int , id:String, price :String ){
        let newItem = Basket(counter: counter, id : id , price :price )
        basket.append(newItem)
        
        }
    
    
//    The findItemById() method takes an id of type String and searches the basket array for a Basket object that has the same id as the one passed in. If it finds a matching Basket, it returns the index of that Basket in the basket array. If it doesn't find a matching Basket, it returns nil.
    
    static func findItemById(id: String) -> Int? {
        var i = 0
        for item in basket {
            
            if item.id == id {
                return (i)
            }
            i += 1
        }
        return nil
    }
    
    
//    The totalPrice() method calculates the total price of the items in the basket. It iterates through the basket array and multiplies the price property of each Basket object by its counter property. It then returns the sum of all these products.
    
    static func totalPrice() -> Float {
        
        var i : Float = 0.0
        for item in self.basket{

            i += ((Float(item.price) ?? 1) * Float(item.counter))
        }
        return i 
    }
    
    
    
    
}
