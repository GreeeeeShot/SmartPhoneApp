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

class NavigationViewController: UIViewController, CLLocationManagerDelegate, XMLParserDelegate {
    
    var location: CLLocation? = nil
    var address: String!
    
    let regionRadius: CLLocationDistance = 500
    
    var toilets = [Toilet]()
    
    var posts = NSMutableArray()
    
    var citycode = "0"
    
    var url : String = "http://openapi.gg.go.kr/Publtolt?KEY=c3599d84eb594408b1735412f90f7fdb&pSize=1000&SIGUN_CD="
    
    var cityurl: String = " "
    
    var parser = XMLParser()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    
    var XPos = NSMutableString()
    var YPos = NSMutableString()
    
    var near: Float = -1
    var nearToilet: String = " "
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    
    func beginParsing()
    {
        posts = []
        cityurl = url + citycode
        parser = XMLParser(contentsOf:(URL(string:cityurl))!)!
        parser.delegate = self
        parser.parse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.pausesLocationUpdatesAutomatically = false
        
        if let coor = locationManager.location?.coordinate{
            location = CLLocation(latitude: coor.latitude, longitude: coor.longitude)
        }
        
        mapView.showsUserLocation = true
        centerMapOnLocation(location: location!)
        //print("near:\(near) nearToilet:\(nearToilet)")
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
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
            
            if address.contains("수원") == true {
                self.citycode = "41110"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("성남") == true{
                self.citycode = "41130"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("의정부") == true{
                self.citycode = "41150"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("안양") == true{
                self.citycode = "41170"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("부천") == true{
                self.citycode = "41190"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("광명") == true{
                self.citycode = "41210"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("평택") == true{
                self.citycode = "41220"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("동두천") == true{
                self.citycode = "41250"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("안산") == true{
                self.citycode = "41270"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("고양") == true{
                self.citycode = "41280"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("과천") == true{
                self.citycode = "41290"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("구리") == true{
                self.citycode = "41310"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("남양주") == true{
                self.citycode = "41360"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("오산") == true{
                self.citycode = "41370"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("시흥") == true{
                self.citycode = "41390"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("군포") == true{
                self.citycode = "41410"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("의왕") == true{
                self.citycode = "41430"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("하남") == true{
                self.citycode = "41450"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("용인") == true{
                self.citycode = "41460"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("파주") == true{
                self.citycode = "41480"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("이천") == true{
                self.citycode = "41500"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("안성") == true{
                self.citycode = "41550"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("김포") == true{
                self.citycode = "41570"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("화성") == true{
                self.citycode = "41590"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("광주") == true{
                self.citycode = "41610"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("양주") == true{
                self.citycode = "41630"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("포천") == true{
                self.citycode = "41650"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("여주") == true{
                self.citycode = "41670"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("연천") == true{
                self.citycode = "41800"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else if address.contains("가평") == true{
                self.citycode = "41820"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            } else {
                self.citycode = "41830"
                self.beginParsing()
                self.loadInitalData()
                self.FindNearToilet(location: self.location!)
            }
            
            print("citycode : \(self.citycode)")
            
            self.locationManager.stopUpdatingLocation()
            
            
        })
    }
    
    func FindNearToilet(location: CLLocation){
        for t in toilets {
            let x = t.coordinate.latitude
            let y = t.coordinate.longitude
            let result = pita(x1: Float(location.coordinate.latitude), x2: Float(x), y1: Float(location.coordinate.longitude), y2: Float(y))
            if (near < 0 || near > result){
                near = result
                nearToilet = t.title!
            }
        }
        for t in toilets {
            if (t.title?.contains(nearToilet) == true){
                mapView.addAnnotation(t)
                break
            }
        }
    }
    
    
    func pita(x1: Float, x2: Float, y1: Float, y2: Float)->Float{
        return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
    }
    
    func loadInitalData() {
        for post in posts{
            let yadmNm = (post as AnyObject).value(forKey: "PBCTLT_PLC_NM") as! NSString as String
            let addr = (post as AnyObject).value(forKey: "REFINE_LOTNO_ADDR") as! NSString as String
            let XPos = (post as AnyObject).value(forKey: "REFINE_WGS84_LOGT") as! NSString as String
            let YPos = (post as AnyObject).value(forKey: "REFINE_WGS84_LAT") as! NSString as String
            let lat = (YPos as NSString).doubleValue
            let lon = (XPos as NSString).doubleValue
            let hospital = Toilet(title: yadmNm, locationName: addr, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            toilets.append(hospital)
        }
    }
    
    func mapView(_ mapView:MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Toilet
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation!) -> MKAnnotationView? {
        if let annotation = annotation as? Toilet{
            let identifier = "pin"
            var view: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row")
        {
            elements = NSMutableDictionary()
            elements = [:]
            yadmNm = NSMutableString()
            yadmNm = ""
            addr = NSMutableString()
            addr = ""
            
            XPos = NSMutableString()
            XPos = ""
            YPos = NSMutableString()
            YPos = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String!)
    {
        if element.isEqual(to: "PBCTLT_PLC_NM") {
            yadmNm.append(string)
        }
        else if element.isEqual(to: "REFINE_LOTNO_ADDR") {
            addr.append(string)
        }
        else if element.isEqual(to: "REFINE_WGS84_LOGT")
        {
            XPos.append(string)
        }
        else if element.isEqual(to: "REFINE_WGS84_LAT")
        {
            YPos.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!)
    {
        if (elementName as NSString).isEqual(to: "row") {
            if !yadmNm.isEqual(nil) {
                elements.setObject(yadmNm, forKey: "PBCTLT_PLC_NM" as NSCopying)
            }
            if !addr.isEqual(nil) {
                elements.setObject(addr, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
            }
            if !XPos.isEqual(nil){
                elements.setObject(XPos, forKey: "REFINE_WGS84_LOGT" as NSCopying)
            }
            if !YPos.isEqual(nil){
                elements.setObject(YPos, forKey: "REFINE_WGS84_LAT" as NSCopying)
            }
            posts.add(elements)
        }
    }
}
