//
//  ContentView.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigateTo: AnyView?
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Menu {
                    Button {
                        self.navigateTo = AnyView(MainScreen())
                        self.isActive = true
                    } label: {
                        Text("Home")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.darkGray4)
                    }
                    Button {
                        self.navigateTo = AnyView(CurrentOrderScreen())
                        self.isActive = true
                    } label: {
                        Text("Current Orders")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.darkGray4)
                    }
                    Button {
                        self.navigateTo = AnyView(HelpScreen())
                        self.isActive = true
                    } label: {
                        Text("Help")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.darkGray4)
                    }.padding(.trailing, 290).offset(y: -100)

                } label: {
                    Text("")
                    Image("icons8-menu-50")
                }
                .frame(width: 50, height: 50)
                .padding(.trailing, 290)
                .offset(y: -350)
                .zIndex(1)
                .background(
                    NavigationLink(destination: self.navigateTo, isActive: $isActive) {
                        EmptyView()
                    })
                
                LoginScreen()
                
            }.background(Color.darkGray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //LoginScreen()
    }
}
