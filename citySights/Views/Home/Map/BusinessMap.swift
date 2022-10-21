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
    @Binding var selectedBusiness: Business?
    
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.restaurants + model.sights {
            // create new annotation
            let a = MKPointAnnotation()
            
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
        mapView.delegate = context.coordinator
        
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
        uiView.showAnnotations(self.locations, animated: true)
        
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // MARK - Coordinator class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // if annotation is the user blue dot, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            // check if there's a resuable annotaiton view first
            // if it can get a resuable annotation, it will return it. else, returns nil
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                // create new one
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
            } else {
                annotationView!.annotation = annotation
            }
            
            // return it
            return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            // user tapped on the annotation view
            
            
            // get the business object that this annotation represents
            
            
            // set the selectedBusiness property to that business object
            // loop through business in the model and find a match
            
            for business in map.model.restaurants + map.model.sights {
                if business.name == view.annotation?.title {
                    map.selectedBusiness = business
                    return
                }
            }
        }
        
    }
    
}
