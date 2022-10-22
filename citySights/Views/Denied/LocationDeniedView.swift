//
//  LocationDeniedView.swift
//  citySights
//
//  Created by Lukas on 10/21/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let color = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {

        VStack (spacing: 20) {
            
            Spacer()
            
            Text("Whoops")
                .font(.title)
            
            Text("We need to access your location to provide you with the best sights in the city. You can change your decision at any time in Settings.")
                .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                
                // Open settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    // extra check to see if we can open url
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                    
                }
                    
                
            }, label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height:48)
                        .cornerRadius(10)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(color)
                    
                }

            })
            .padding()
            
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(color)
        

    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
