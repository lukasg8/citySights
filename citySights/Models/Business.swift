//
//  Business.swift
//  citySights
//
//  Created by Lukas on 10/15/22.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var url: String?
    var review_count: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var display_phone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case image_url
        case is_closed
        case url
        case review_count
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case display_phone
        case distance
    }
    
    
    func getImageData() {

        // check image url is not nil
        guard image_url != nil else {
            return
        }

        // download data for image
        if let url = URL(string: image_url!) {

            // get a session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if error == nil {
                        self.imageData = data!
                    }
                }
            }

            dataTask.resume()

        }

    }
    
    
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var country: String?
    var state: String?
    var display_address: [String]?
    
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}
