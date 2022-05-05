//
//  HelpScreen.swift
//  TUeats
//
//  Created by user219074 on 5/1/22.
//

import Foundation
import SwiftUI

struct HelpScreen: View {
    
    @State private var fullText: String = " - What payment methods does TUEats currently accept?"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                ZStack {
                
                    Color.darkGray
            
                    Text("Need Help?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        //.padding(.bottom, 60)
                        .frame(width: 260 , height: 50, alignment: .top)
                        //.padding(.top, 50.0)
            
                    Text("FAQ: ")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .offset(y: 30)
                        .padding(.trailing, 265.0)
                    
                    Text(" - What payment methods are currently accepted by TUEats?\n\n - How do you access past transactions made through the app?\n\n - Who should I contact in case of an ordering error?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: screenWidth)
                        .offset(y: 150)
                        .padding(.trailing, -20)
                    
                    Image("TUTiger")
                        .resizable()
                        .frame(width:200, height:200)
                        .offset(y: 550)
                    
                }
            
            }.navigationTitle("Need Help?")
        }.background(Color.darkGray).foregroundColor(Color.white)
    }
}

struct Previews_HelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        HelpScreen()
    }
}
