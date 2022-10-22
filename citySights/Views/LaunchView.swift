//
//  LaunchView.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
// Testing

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {

        // Detect authorization status of geolocating user
        
        if model.authorizationState == .notDetermined {
            // if undetermined, show onboarding
            OnboardingView()
            
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            // if approved, show home view
            HomeView()
        }
        else {
            // if denied, show denied view
            LocationDeniedView()
        }
        
        
        
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
