//
//  ProductScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

struct ProductScreen: View {
    
    let boxWidth: CGFloat = (screenWidth / 2) - 14
    let boxHeight: CGFloat = 50
    
    var body: some View {
        ZStack{
            Color.darkGray3.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack {
                    Text("Select Products")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 10)
            
                    Spacer()
                    
                    NavigationLink(destination: CartScreen(), label: {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width:30, height:30)
                            .padding(.trailing, 20)
                            .foregroundColor(.blue)
                    })

                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)

                ScrollView{
                    ProductListItem(product: productList[0])
                        .padding(.bottom, -2)

                }

                
                Spacer()
                
                HStack {
                    Button {
                        print("button pressed")
                    } label: {
                        Text("Checkout")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: boxWidth , height: boxHeight)
                            .background(Color.darkGray4)
                            .cornerRadius(10.0)
                    }
                    
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

                    Text(" " + String(product.quantity) + " ")
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
