//
//  HomeView.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {

            NavigationView {
                
                if !isMapShowing {
                    // show list
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                            
                        }
                        Divider()
                        
                        BusinessList()
                        
                    }
                    .padding([.horizontal,.top])
                    .toolbar(.hidden)
                }
                else {
                    // show map
                    BusinessMap()
                        .ignoresSafeArea()
                }
                
            }
            
        }
        else {
            ProgressView()

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
