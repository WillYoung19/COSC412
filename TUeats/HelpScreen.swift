//
//  HelpScreen.swift
//  TUeats
//
//  Created by user219074 on 5/1/22.
//

import Foundation
import SwiftUI

struct HelpScreen: View {
        
    var body: some View {
        ZStack{
            Color.darkGray2.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8){
                
                Text("FAQ:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 30)

                ScrollView{
                   FAQBox(question: "What payment methods are supported",
                           answer: "The first release will only support Apple Pay. We plan to eventually add TU Meal Plan Points as an alternative method.")
                    
                    FAQBox(question: "How do I view past transactions?",
                            answer: "Once this functionality is implemented, you may view past orders using the dropdown menu in the main screen.")

                    FAQBox(question: "Who created TU Eats??",
                            answer: "A team of four Towson University students known as Team Sigma and TUe.")

                    FAQBox(question: "Who do I contact support?",
                            answer: "You may contact us via GitHub using the button below.")
                }
                
                Spacer()
            
                Text("Need more help? Find us on GitHub:")
                    .font(.title2)
                    .foregroundColor(.white)

                Button{
                    if let url = URL(string: "https://github.com/WillYoung19/COSC412"){
                                UIApplication.shared.open(url, options: [:])}
                } label: {
                    Text("GitHub")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: screenWidth-40 , height: boxHeight)
                        .background(.blue)
                        .cornerRadius(10.0)
                }
            }.frame(width: screenWidth-40)

        }.navigationTitle("Need Help?")
    }
}

struct Previews_HelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        HelpScreen()
    }
}


struct FAQBox: View {
    var question: String
    var answer: String
    
    var body: some View {
        

            

        
        VStack(alignment: .leading, spacing: 6){
            Text("Q: " + question)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text(answer)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .padding(.top, 10)
                .padding(.trailing, 10)
                .frame(maxWidth: screenWidth, alignment: .leading)
                .background(Color.darkGray3)
                .cornerRadius(8)

        }
        
    }
}

struct FAQBox_Previews: PreviewProvider {
    static var previews: some View {
        FAQBox(question: "Who Created TUEats?",
               answer: "A team of four software engineers known as Team Sigma and TUe")
    }
}
