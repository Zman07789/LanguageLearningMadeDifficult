//
//  ContentView.swift
//  LanguageLearningMadeDifficult
//
//  Created by Zack Paulson on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                Image("languagebackground")
                VStack(spacing: 50) {
                    Image("primary")
                        .cornerRadius(180)
                        .padding(.all)
                    
                    NavigationLink(destination: NewPageView()) {
                        HStack {
                            Text("Start Learning A New Language")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                           // Image(systemName: "chevron.right.circle.fill")
                        }
                        
                        
                    }
                    VStack{
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundColor(Color.blue)
                                .padding(0.5)
                            
                        }
                        Text((" (27,449 Reviews ) "))
                            .background(Color.white)
                            .cornerRadius(25)
                            .bold()
                        
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/))
                .background(Color.gray)
                
            }
        }
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
        
    }

