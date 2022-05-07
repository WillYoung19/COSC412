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
    var fname: String = ""
    var lname: String = ""
    var TUID: String = ""
    
    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8){
                
                Text("Order Successful")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("Thank you " + fname)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 10)

                
                Text("Your order for $" + String(cartManager.total_price) + " will be ready for pickup soon at " + cartManager.products[0].rname)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                Text("Please have your OneCard or Phone ready to verify your identify")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 30)

                
                Text("Order Details:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                    
                Group{
                    Text("Name: " + fname + " " + lname)
                    Text("Order Price: $" + String(cartManager.total_price))
                    Text("Restaurant: " + cartManager.products[0].rname)

                }.font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, -4)
                
                Spacer()

                
                NavigationLink{
                    MainScreen()
                } label: {
                    Text("Go Home")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: screenWidth-50 , height: boxHeight)
                        .background(Color.darkGray4)
                        .cornerRadius(10.0)
                }
                NavigationLink{
                    MainScreen()
                } label: {
                    Text("Cancel Order")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: screenWidth-50 , height: boxHeight)
                        .background(Color.darkGray4)
                        .cornerRadius(10.0)
                }
            }.frame(width: screenWidth-50)

        }.navigationTitle("My Orders")
       .navigationBarHidden(true)
    }
}
