//
//  BusinessMap.swift
//  citySights
//
//  Created by Lukas on 10/19/22.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.restaurants + model.sights {
            // create new annotation
            var a = MKPointAnnotation()
            
            // if business has a lat/long, create an MKPointAnnotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
        }
        
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        // make user show up on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // add ones based on the business
        uiView.addAnnotations(self.locations)
        
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
}
