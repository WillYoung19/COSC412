//
//  LoginScreen.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/27/22.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView{
            ZStack{
                Color.darkGray.edgesIgnoringSafeArea(.all)
                VStack(spacing: 4){
                    
                    Text("TU Eats")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 80)
                
                    Image("TUTiger")
                        .resizable()
                        .frame(width:260, height:233)

                    Spacer()
                    
                    Group{
                        SecureField("", text: $username)
                            .placeholder(when: username.isEmpty) {
                                Text("Enter Username").foregroundColor(.white)}
                        SecureField("", text: $password)
                            .placeholder(when: password.isEmpty) {
                                Text("Enter password").foregroundColor(.white)}
                    }.foregroundColor(.white)
                        .frame(width:300, height:40)
                        .padding(.leading, 10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.darkGray4))

                    Spacer()
                    
                    LoginButton(buttonText: "Login")
                    LoginButton(buttonText: "Register")
                    

                    NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true), label: {
                        Text("Login as Guest")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .underline()
                            .foregroundColor(.blue)
                            .frame(width: 260, height: 50, alignment: .center)
                    })
                }
            }.navigationBarHidden(true)
        }
    }
}

struct LoginButton: View {
    var buttonText = ""
    
    var body: some View {
        Button {
            print("button pressed")
        } label: {
            Text(buttonText)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 260, height: 50, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10.0)
        }
    }
}
