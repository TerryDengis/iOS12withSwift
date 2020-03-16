//
//  ViewController.swift
//  Map View
//
//  Created by Terry Dengis on 12/10/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var latitude = 51.501364
    var longitude = -0.1418899999999894
    var manager = CLLocationManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion (center: CLLocationCoordinate2D (latitude: latitude, longitude: longitude), span: span)
        mapView.setRegion(region, animated: true)
        
        let pinLocation = CLLocationCoordinate2DMake (latitude, longitude)
        let pinObject = MKPointAnnotation ()
        pinObject.coordinate = pinLocation
        pinObject.title = "Buckingham Palace"
        pinObject.subtitle = "Westminster, London SW1A 1AA, UK"
        mapView.addAnnotation(pinObject)
        
        manager.delegate = self
    }

    @IBAction func standard(_ sender: Any) {
        mapView.mapType = .standard
    }
    
    @IBAction func satellite(_ sender: Any) {
        mapView.mapType = .satellite
    }
    
    @IBAction func hybrid(_ sender: Any) {
        mapView.mapType = .hybrid
    }
    
    @IBAction func locate(_ sender: Any) {
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    @IBAction func directions(_ sender: Any) {
        
        UIApplication.shared.open(URL (string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D (latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan (latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }
}

