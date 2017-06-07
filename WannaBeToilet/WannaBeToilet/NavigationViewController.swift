//
//  NavigationViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 6. 7..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit
import MapKit

import CoreLocation

class NavigationViewController: UIViewController, CLLocationManagerDelegate {
    
    var location: CLLocation? = nil
    var address: String!
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.pausesLocationUpdatesAutomatically = false
        
        mapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치가 업데이트될때마다
        if let coor = manager.location?.coordinate{
            location = CLLocation(latitude: coor.latitude, longitude: coor.longitude)
            print("latitude: \(coor.latitude) longitude: \(coor.longitude)")
            convertToAddressWith(coordinate: location!)
        }
    }
    
    func convertToAddressWith(coordinate: CLLocation) {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
            
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            guard let placemark = placemarks?.first,
                let addrList = placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
                    return
            }
            
            let address = addrList.joined(separator: " ")
            
            print("address: \(address)")
            print("addList: \(addrList)")
            
            self.locationManager.stopUpdatingLocation()
            
        })
    }
    
}
