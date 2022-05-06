//
//  CurrentOrderScreen.swift
//  TUeats
//
//  Created by user219074 on 5/1/22.
//

import Foundation
import SwiftUI



struct OrderFinalScreen: View {

    @EnvironmentObject var cartManager: CartMgr

    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
       
        }
        .navigationTitle("Order Information")
    }
}
