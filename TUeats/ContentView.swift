//
//  ContentView.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/22/22.
//

import SwiftUI
import WrappingHStack

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

struct ContentView: View {
    var body: some View {
        LoginScreen()
    }
}

struct LoginScreen: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.darkGray.edgesIgnoringSafeArea(.all)
                VStack(spacing: 4){
                    
                    Text("TU Eats")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 600)
                
                    Button {
                        print("button pressed")
                    } label: {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 260 , height: 50, alignment: .center)
                            .background(Color.darkGray4)
                            .cornerRadius(10.0)
                    }
                    
                    NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true), label: {
                        Text("Login as Guest")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 260 , height: 50, alignment: .center)
                            .background(Color.darkGray4)
                            .cornerRadius(10.0)
                    })
                }
            }.navigationBarHidden(true)
        }
    }
}

struct MainScreen: View {
    var body: some View {
        ZStack{
            Color.darkGray.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                //Title
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
                    
                    Button {
                        print("button pressed")
                    } label: {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width:30, height:30)
                            .padding(.trailing, 20)


                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)

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
            
            //ProductListItem(productName: "Pizza", price: 10.5)

        }
    }
}

struct CartScreen: View {
    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            
            
            
        }
    }
}

struct ProductListItem: View {
    var productName: String = "Item"
    var price: Float = 0
    
    var body: some View {
        VStack{
            
            Text(productName)
                .foregroundColor(.white)
            
            Text(String(price))
                .foregroundColor(.white)
            
            
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}

