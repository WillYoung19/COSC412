//
//  Product.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

var productList = [Product(name: "Pizza", price: 10),
                   Product(name: "Water", price: 1.50)]

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int = 0
    
}

