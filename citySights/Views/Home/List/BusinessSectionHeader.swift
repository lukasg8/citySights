//
//  BusinessSectionHeader.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
            
        }
        
        
    }
}
