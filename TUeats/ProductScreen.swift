//
//  ProductScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI


struct ProductScreen: View {
    var selectedRestaurant: Restaurant

    let boxWidth: CGFloat = (screenWidth / 2) - 14
    let boxHeight: CGFloat = 50
    
    var body: some View {
        ZStack{
            Color.darkGray3.edgesIgnoringSafeArea(.all)
            
            VStack{
                ScrollView{
                    if (selectedRestaurant.name == "Newell Den"){
                        ForEach(productList1, id: \.id){ product in
                            ProductListItem(product: product)
                                .padding(.bottom, -2)
                        }
                    }
                    else if (selectedRestaurant.name == "Au Bon Pain"){
                        ForEach(productList2, id: \.id){ product in
                            ProductListItem(product: product)
                                .padding(.bottom, -2)
                        }
                    }
                    else if (selectedRestaurant.name == "Deli"){
                        ForEach(productList3, id: \.id){ product in
                            ProductListItem(product: product)
                                .padding(.bottom, -2)
                        }
                    }
                }

                Spacer()
                
                HStack {
                    NavigationLink(destination: CartScreen(), label: {
                        Text("Checkout")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: boxWidth , height: boxHeight)
                            .background(Color.darkGray4)
                            .cornerRadius(10.0)
                    })
                    
                    Button {
                        print("button pressed")
                    } label: {
                        Text("Add to Cart")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: boxWidth , height: boxHeight)
                            .background(Color.darkGray4)
                            .cornerRadius(10.0)
                    }
                }
            }
        }
        .navigationTitle("Select Products")
        .navigationBarItems(trailing:
                        NavigationLink(destination: CartScreen(), label: {
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width:30, height:30)
                                .foregroundColor(.blue)
                        }))
    }
}

struct ProductListItem: View {
    var product: Product
    @State private var qty: Int = 0
        var body: some View {
            HStack{
                
                Group{
                    Text(product.name + "\n")
                        .fontWeight(.bold) +
                    
                    Text("Price: $" + String(product.price))
                }
                .padding(.leading, 6)
                .padding(.top, 6)
                .padding(.bottom, 6)

                .font(.title2)
                .foregroundColor(.white)

                Spacer()

                Group{
                    Button {
                        if (qty > 0){
                            qty -= 0
                        }
                        else{
                            qty = 0
                        }
                    } label: {
                        Text("-")
                            .foregroundColor(.white)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.darkGray2)
                    .cornerRadius(20.0)

                    Text(" " + String(qty) + " ")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    
                    Button {
                        qty += 1
                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.darkGray2)
                    .cornerRadius(20.0)
                    .padding(.trailing, 20)

                    
                }
                .font(.title2)
                .foregroundColor(.black)
                
            }
            .frame(width: screenWidth)
            .background(Color.darkGray4)
            .cornerRadius(10.0)
    
    }
}
