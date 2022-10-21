//
//  BusinessTitle.swift
//  citySights
//
//  Created by Lukas on 10/21/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {

        VStack (alignment: .leading) {
            Text(business.name!)
                .font(.largeTitle)
            
            if business.location?.display_address != nil {
                ForEach(business.location!.display_address!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            Image("regular_\(business.rating ?? 0)")
        }
    }
}
