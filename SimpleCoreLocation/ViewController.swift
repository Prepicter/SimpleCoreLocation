//
//  ViewController.swift
//  SimpleCoreLocation
//
//  Created by D7702_09 on 2019. 11. 5..
//  Copyright © 2019년 csd5766. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // delegate 연결
        locationManager.delegate = self
        
        
//        mapView.setCenter(center, animated: true)
//        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
//        let region = MKCoordinateRegion(center: center, span: span)
//
//        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        let center = CLLocationCoordinate2D(latitude: 35.165780, longitude: 129.072522)
        pin.coordinate = center
        pin.title = "동의과학대"
        pin.subtitle = "학교"
        
        let pin2 = MKPointAnnotation()
        pin2.coordinate.latitude = 35.1641918
        pin2.coordinate.longitude = 129.0627359
        pin2.title = "송상현광장"
        pin2.subtitle = "공원"
        
        let pin3 = MKPointAnnotation()
        pin3.coordinate.latitude = 35.1681759
        pin3.coordinate.longitude = 129.0549518
        pin3.title = "시민공원"
        pin3.subtitle = "공원"
        
        mapView.addAnnotations([pin, pin2, pin3])
        
        // 나의 위치 트래킹
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        
        
        
        mapView.showsUserLocation = true
        
        
        
        
        
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        print(userLocation)
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
        
    }
    
    


}

