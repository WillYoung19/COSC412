//
//  CartScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var cartManager: CartMgr
    
    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                    if cartManager.products.count > 0 {
                        ScrollView{
                            ForEach(cartManager.products, id: \.id){ product in
                                CartItem(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                            
                        Spacer()
                        
                        Group{
                            Text("Total Price:  $") +
                            Text(String(cartManager.total_price))
                                .bold()
                            Spacer()
                        }
                        .frame(width: screenWidth-40, height: 40, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.title3)

                        NavigationLink{
                            OrderInfoScreen()
                                .environmentObject(cartManager)
                        } label: {
                            Text("Checkout")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: screenWidth - 40 , height: boxHeight)
                                .background(Color.darkGray4)
                                .cornerRadius(10.0)
                        }
                    }
                    else{
                        Text("Cart is Empty")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading, 20)
                        Spacer()
                    }
                }
                
        }.navigationTitle("My Cart")
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
            .environmentObject(CartMgr())
    }
}


struct CartItem: View {
    var product: Product
    
    @EnvironmentObject var cartManager: CartMgr
    
    var body: some View {
        HStack{
            Text(product.name)
                .fontWeight(.bold)
                .padding(.leading, 6)
                .padding(.top, 6)
                .padding(.bottom, 6)
                .font(.title2)
                .foregroundColor(.white)
            Text("$" + String(product.price))
                .font(.title2)
                .padding(.leading, 20)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("X")
                .fontWeight(.bold)
                .padding(.trailing, 15)
                .font(.title)
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .frame(width: screenWidth - 16, height: 50)
        .background(Color.darkGray3)
        .cornerRadius(6.0)
    }
}
