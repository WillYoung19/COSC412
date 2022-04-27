//
//  LoginScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

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
