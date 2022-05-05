//
//  Product.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

//var ref: DatabaseReference!

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

var productList1 = [Product(name: "Pizza", price: 10, rname: "Newell Den"),
                   Product(name: "Water", price: 1.50, rname: "Newell Den")]

var productList2 = [Product(name: "Pizza", price: 15, rname: "Au Bon Pain"),
                   Product(name: "Water", price: 2.50, rname: "Au Bon Pain")]

var productList3 = [Product(name: "Pizza", price: 1, rname: "Deli")]

var restaurantList = [Restaurant(name: "Newell Den", isClosed: false),
                      Restaurant(name: "Au Bon Pain", isClosed: false),
                      Restaurant(name: "Deli", isClosed: false)]

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
    }
    func removeFromCart(product: Product){
        products = products.filter {$0.id != product.id}
        total_price -= product.price
    }
}

