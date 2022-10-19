//
//  BusinessDetail.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geo in
                    
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
            
                                
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.is_closed! ? .gray : .blue)
                    
                    Text(business.is_closed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.horizontal)
                }
            }
                
        Group {
            
            Text(business.name!)
                .font(.largeTitle)
                .padding(.horizontal)
            
            if business.location?.display_address != nil {
                ForEach(business.location!.display_address!, id: \.self) { displayLine in
                    Text(displayLine)
                        .padding(.horizontal)
                }
            }
            
            Image("regular_\(business.rating ?? 0)")
                .padding(.horizontal)
            
            Divider()
            
            HStack {
                Text("Phone:")
                    .bold()
                Text(business.display_phone ?? "")
                Spacer()
                Link("Call",destination: URL(string: "tel:\(business.phone ?? "")")!)
            }
            .padding()
            
            
            Divider()
            
            HStack {
                Text("Reviews:")
                    .bold()
                Text(String(business.review_count ?? 0))
                Spacer()
                Link("Read",destination: URL(string: "tel:\(business.url ?? "")")!)
            }
            .padding()
            
            Divider()
            
            HStack (spacing: 20) {
                Text("Website:")
                    .bold()
                Text(business.url ?? "0")
                    .lineLimit(1)
                Spacer()
                Link("Visit",destination: URL(string: "tel:\(business.url ?? "")")!)
            }
            .padding()
            
            Button(action: {
                
            }, label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            })
            .padding(.horizontal)
            
        }
                
                
            
            
        }
        
        
    }
}
