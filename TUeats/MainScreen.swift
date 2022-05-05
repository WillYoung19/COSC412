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
                
                WrappingHStack{
                    RestaurantBox(restaurant: restaurantList[0])
                    RestaurantBox(restaurant: restaurantList[1])
                    RestaurantBox(restaurant: restaurantList[2])
                        .padding(.top, 6)
                }.padding(.leading, 10)
                                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct RestaurantBox: View {
    var restaurant: Restaurant

    let boxWidth: CGFloat = (screenWidth / 2) - 14
    let boxHeight: CGFloat = 200
    var body: some View {
        NavigationLink(destination: ProductScreen(selectedRestaurant: restaurant), label: {
            
            VStack(alignment: .leading, spacing: 4){
                
                Text(restaurant.name)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
                .padding(.top, 6)
                
                RestaurantStatusText(restaurant: restaurant)
                    .padding(.leading, 6)
                
            }.frame(width: boxWidth, height: boxHeight, alignment: .topLeading)
                .background(Color.darkGray3)
                .cornerRadius(20.0)
            
        })
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct RestaurantStatusText: View {
    var restaurant: Restaurant

    var body: some View {
        if(restaurant.isClosed == false){
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

