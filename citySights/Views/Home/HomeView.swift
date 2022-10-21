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
    @State var selectedBusiness:Business?
    
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
                    
                    ZStack (alignment: .top) {
                        // show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                // create a business detail view instance
                                // pass in selected business
                                BusinessDetail(business: business)
                            }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height:48)
                            HStack {
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }
                                
                            }
                            .padding()
                        }
                        .padding()
                        
                    }
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
