//
//  BusinessSearch.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
