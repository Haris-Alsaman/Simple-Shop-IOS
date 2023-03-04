//
//  ImageCache.swift
//  Shop
//
//  Created by haris on 27.02.2023.
//

import Foundation
import UIKit


//The CommonCrypto framework is imported, but it is not used in this code.
import CommonCrypto


//The class contains a static property called imageCache, which is an instance of the NSCache class with a key type of NSString and a value type of UIImage.

class ImageCache {
    
//    This imageCache property can be used to store and retrieve images for faster loading times and improved performance in applications that use a lot of images.
  static var imageCache = NSCache<NSString, UIImage>()
    
}
