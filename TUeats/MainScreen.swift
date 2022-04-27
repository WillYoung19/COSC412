//
//  MainScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI
import WrappingHStack

struct MainScreen: View {
    var body: some View {
        ZStack{
            Color.darkGray.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
            
                Text("Select a Restaurant")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 14)
                    .padding(.top, 10)

                //For each restauant in the DB, create a Restaurant box
                WrappingHStack{
                    RestaurantBox(nextScreen: ProductScreen(), rName: "Newell Den", isClosed: false)
                    RestaurantBox(nextScreen: ProductScreen(), rName: "Au Bon Pain", isClosed: false)
                    RestaurantBox(nextScreen: ProductScreen(), rName: "Deli", isClosed: true)
                        .padding(.top, 6)
                }
                .padding(.leading, 10)

                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct RestaurantBox<DestinationScreen: View>: View {
    var nextScreen: DestinationScreen
    var rName: String = "Restaurant Name"
    var isClosed: Bool = false

    let boxWidth: CGFloat = (screenWidth / 2) - 14
    let boxHeight: CGFloat = 200
    var body: some View {
        NavigationLink(destination: nextScreen, label: {
            
            VStack(alignment: .leading, spacing: 4){
                
            Text(rName)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
                .padding(.top, 6)
                
                RestaurantStatusText(isClosed: isClosed)        .padding(.leading, 6)

        
            }.frame(width: boxWidth, height: boxHeight, alignment: .topLeading)
                .background(Color.darkGray3)
                .cornerRadius(20.0)
            
        })
    }
}

struct RestaurantStatusText: View {
    var isClosed: Bool = false
    
    var body: some View {
        if(isClosed == false){
            Text("Status: ")
                .foregroundColor(.white) +
            Text("Open")
                .foregroundColor(.green)
        }
        else{
            Text("Status: ")
                .foregroundColor(.white) +
            Text("Unavailable")
                .foregroundColor(.red)
        }
    }
}

