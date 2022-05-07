//
//  Product.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

//var ref: DatabaseReference!

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let boxWidth: CGFloat = (screenWidth / 2) - 14
let boxHeight: CGFloat = 50

var productList1 = [Product(name: "Cheese Pizza Slice", price: 3.49, rname: "Den Mangiamo"),
                   Product(name: "Pepperoni Pizza Slice", price: 3.69, rname: "Den Mangiamo"),
                    Product(name: "Whole Cheese Pizza", price: 15.99, rname: "Den Mangiamo"),
                    Product(name: "Whole Pepperoni Pizza", price: 16.99, rname: "Den Mangiamo"),
                    Product(name: "Chicken Parmesan", price: 7.99, rname: "Den Mangiamo"),
                    Product(name: "Spaghetti and Metballs", price: 7.99, rname: "Den Mangiamo"),
                    Product(name: "Baked Ziti", price: 7.29, rname: "Den Mangiamo"),
                    Product(name: "Stromboli", price: 5.99, rname: "Den Mangiamo"),
                    Product(name: "Breadsticks", price: 3.29, rname: "Den Mangiamo")

]

var productList2 = [Product(name: "Italian Sub", price: 8.99, rname: "Den Delicatessen"),
                    Product(name: "Turkey Club", price: 7.99, rname: "Den Delicatessen"),
                    Product(name: "Classic Reuben", price: 6.79, rname: "Den Delicatessen"),
                    Product(name: "London Broi Wrap", price: 7.99, rname: "Den Delicatessen"),
                    Product(name: "Blazing Buffalo Sandwich", price: 9.99, rname: "Den Delicatessen"),
                    Product(name: "SmokeMaster Panin", price: 11.29, rname: "Den Delicatessen"),
                    Product(name: "Ichiban Sandwich", price: 10.29, rname: "Den Delicatessen"),
                    Product(name: "Heart Healthy Sandwich", price: 8.29, rname: "Den Delicatessen"),
]

//ABP
var productList3 = [Product(name: "Everything Bagel", price: 2.29, rname: "Au Bon Pain"),
                    Product(name: "Cinnamon Crisp Bagel", price: 1.99, rname: "Au Bon Pain"),
                    Product(name: "Bacon and Egg Bagel", price: 3.99, rname: "Au Bon Pain"),
                    Product(name: "Spicy Tuna Sandwich", price: 4.79, rname: "Au Bon Pain"),
                    Product(name: "Crumb Cake", price: 2.99, rname: "Au Bon Pain"),
                    Product(name: "Pecan Roll", price: 2.59, rname: "Au Bon Pain"),
                    Product(name: "Apple Croissant", price: 2.99, rname: "Au Bon Pain"),
                    Product(name: "Lemon Danish", price: 3.29, rname: "Au Bon Pain"),
                    Product(name: "Chocolate Chip Brownie", price: 2.99, rname: "Au Bon Pain"),
                    Product(name: "Blueberry Yogurt", price: 1.79, rname: "Au Bon Pain"),
                    Product(name: "Strawberry Smoothie", price: 4.19, rname: "Au Bon Pain"),
                    Product(name: "Vanilla Latte", price: 4.39, rname: "Au Bon Pain"),
                    Product(name: "French Roast Coffee", price: 4.59, rname: "Au Bon Pain"),
                    Product(name: "Pecan Roll", price: 2.59, rname: "Au Bon Pain")
]

var productList4 = [Product(name: "Black Pepper Chicken", price: 8.79, rname: "Panda Express"),
                    Product(name: "Kung Pao Chicken", price: 8.79, rname: "Panda Express"),
                    Product(name: "String Bean Chicken", price: 8.79, rname: "Panda Express"),
                    Product(name: "Sweet and Sour Chicken", price: 8.79, rname: "Panda Express"),
                    Product(name: "Beijing Beef", price: 8.79, rname: "Panda Express"),
                    Product(name: "Broccoil Beef", price: 8.79, rname: "Panda Express"),
                    Product(name: "Honey Walnut Shrimp", price: 7.79, rname: "Panda Express"),
                    Product(name: "Chicken Egg Roll", price: 1.99, rname: "Panda Express"),
                    Product(name: "Vegtable Spring Roll", price: 1.99, rname: "Panda Express"),
                    Product(name: "Fried rice", price: 3.99, rname: "Panda Express"),
                    Product(name: "White Steamed Rice", price: 1.99, rname: "Panda Express"),


]

var restaurantList = [Restaurant(name: "Den Mangiamo", isClosed: false),
                      Restaurant(name: "Den Delicatessen", isClosed: false),
                      Restaurant(name: "Au Bon Pain", isClosed: false),
                      Restaurant(name: "Panda Express", isClosed: false)]

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var rname: String
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var isClosed: Bool = false
}

class CartMgr: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total_price: Double = 0
    
    func addToCart(product: Product){
        products.append(product)
        total_price += product.price
        total_price = round(total_price * 100)/100.0
    }
    func removeFromCart(product: Product){
        products = products.filter {$0.id != product.id}
        total_price -= product.price
        total_price = round(total_price * 100)/100.0

    }
}

