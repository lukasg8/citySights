//
//  OnboardingView.swift
//  citySights
//
//  Created by Lukas on 10/21/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {

        VStack {
            
            TabView(selection: $tabSelection) {
                
                // first tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")

                }
                .foregroundColor(.white)
                .tag(0)
                .padding()
                
                
                // second tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                }
                .foregroundColor(.white)
                .tag(1)
                .padding()

                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button(action: {
                
                if tabSelection == 0 {
                    tabSelection = 1
                } else {
                    model.requestGeolocationPermission()
                }
                
                
            }, label: {
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                    
                }
            })
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            
            Spacer()
            
            
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .multilineTextAlignment(.center)


    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
