//
//  CurrentOrderScreen.swift
//  TUeats
//
//  Created by user219074 on 5/1/22.
//

import Foundation
import SwiftUI

struct CurrentOrderScreen: View {
    
    @EnvironmentObject var cartManager: CartMgr

    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8){
                Text(cartManager.products[0].rname + " Order Successful")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Your order for " + String(cartManager.total_price) + " will be ready for pickup soon")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
            }
        }.navigationTitle("My Orders")
    }
}
