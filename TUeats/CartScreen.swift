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
            
            VStack{
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id){ product in
                        CartItem(product: product)
                    }
                }
                else{
                    Text("Cart Empty")
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
    
    var body: some View {
        HStack{
            Group{
                Text(product.name)
            }
            .padding(.leading, 6)
            .padding(.top, 6)
            .padding(.bottom, 6)
            .font(.title2)
            .foregroundColor(.white)
        }
        .frame(width: screenWidth)
        .background(Color.darkGray4)
        .cornerRadius(10.0)
    }
}
