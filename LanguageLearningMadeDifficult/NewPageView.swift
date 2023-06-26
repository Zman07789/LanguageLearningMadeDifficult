//
//  NewPageView.swift
//  LanguageLearningMadeDifficult
//
//  Created by Zack Paulson on 6/21/23.
//


import SwiftUI


struct NewPageView: View {
    var body: some View {
        ZStack {
            Image("secondpagepicback")
            VStack {
                Text("  Please Pick The Language  ")
                    .underline()
                    .font(.system(size: 25))
                    .background(Color.gray.cornerRadius(45))
                    .padding(5)
                    .cornerRadius(45)
                Text("  You Would Like To Learn  ")
                    .underline()
                    .font(.system(size: 25))
                    .background(Color.gray.cornerRadius(45))
                    .padding(5)
                    .cornerRadius(45)
                VStack {
                    NavigationLink(destination: EnglishView()) { /* Link to apples nav contr page https://developer.apple.com/documentation/uikit/uinavigationcontroller*/
                        Text("English")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80))
                    }
                    
                    NavigationLink(destination: RussianView()) {
                        Text("Russian")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80))
                    }
                    
                    NavigationLink(destination: SpanishView()) {
                        Text("Spanish")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80))
                    }
                    
                    NavigationLink(destination: FrenchView()) {
                        Text("French")
                            .foregroundColor(Color.white)
                            .font(.system(size: 80))
                    }
                }
            }
        }
    }
}

