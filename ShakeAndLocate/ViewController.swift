//
//  ViewController.swift
//  ShakeAndLocate
//
//  Created by Madeline Lopez on 2/26/17.
//  Copyright © 2017 Madeline Lopez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
    @IBOutlet weak var shakeDisplay: UILabel!
    @IBOutlet weak var longDisplay: UILabel!
    @IBOutlet weak var latDisplay: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()

        self.locationManager.startUpdatingLocation()
        
        //self.mapView.showsUserLocation = true
        
    }    
    
    
    
    //Location Delegate Methods
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        //self.mapView.setRegion(region, animated: true)
        
        self.longDisplay.text = "\(center.longitude)"
        
        self.latDisplay.text = "\(center.latitude)"
        
        self.locationManager.stopUpdatingLocation()
        
        print(longDisplay)
        
        print(latDisplay)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ya messed up" + error.localizedDescription)
    }


    override var canBecomeFirstResponder: Bool { return true }
    
    func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .motionShake {
            self.shakeDisplay.text = "Shaken, not stirred"
            print("Shake registered")
        }
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

