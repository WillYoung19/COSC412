//
//  CurrentOrderScreen.swift
//  TUeats
//
//  Created by user219074 on 5/1/22.
//

import Foundation
import SwiftUI



struct OrderInfoScreen: View {
    
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var TUID: String = ""
    @State private var showingAlert = false

    @EnvironmentObject var cartManager: CartMgr


    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8){
                Text("Please enter your details below:")
                    .foregroundColor(.white)
                    .font(.title2)
                
                Group{
                    TextField("", text: $fname)
                        .placeholder(when: fname.isEmpty) {
                            Text("First Name")
                        }
                        .padding(.leading, 10)
                    
                    TextField("", text: $lname)
                        .placeholder(when: lname.isEmpty) {
                            Text("Last Name")
                        }
                        .padding(.leading, 10)

                    TextField("", text: $TUID)
                        .placeholder(when: TUID.isEmpty) {
                            Text("TUID")
                        }
                        .padding(.leading, 10)
                }
                .foregroundColor(.white)
                    .frame(width: screenWidth-200, height:40)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.darkGray4))
            
                Spacer()

                Group{
                    Text("Order Total:  $") +
                    Text(String(cartManager.total_price))
                }.foregroundColor(.white)
                .font(.title3)
            
                NavigationLink{
                    if(fname != "" && lname != "" && TUID != ""){
                        CurrentOrderScreen(fname: fname, lname: lname, TUID: TUID)
                            .environmentObject(cartManager)
                    }
                    else{
                        OrderFailedScreen()

                    }
                } label: {
                    Text("Purchase")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: screenWidth-50 , height: boxHeight)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                        .alert("Important message", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                }.padding(.trailing, 10)
                
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
    
            }
        }
        .navigationTitle("Order Information")
    }
}

struct OrderFailedScreen: View {
    

    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8){
                
                Text("Please go back and ensure your order information is correct")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading, -20)

                Spacer()
            }

        }.navigationTitle("Order Failed")
    }
}

