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
                        print("button pressed")
                    } label: {
                        Text("-")
                            .foregroundColor(.white)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.darkGray2)
                    .cornerRadius(20.0)

                    Text(" 0 ")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    
                    Button {
                        print("button pressed")
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
