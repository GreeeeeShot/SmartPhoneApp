//
//  Toilet.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 5. 28..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import Foundation
import MapKit
import AddressBook

class Toilet: NSObject, MKAnnotation{
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
}
