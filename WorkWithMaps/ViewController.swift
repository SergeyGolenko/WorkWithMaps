//
//  ViewController.swift
//  WorkWithMaps
//
//  Created by Сергей Голенко on 24.12.2020.
//

import UIKit
import MapKit

class ViewController: UIViewController ,MKMapViewDelegate{
    
    @IBOutlet weak var mapWhatShowKharkov: MKMapView!
    
    //load coordinate for Kharkov
    func loadCoordinateKharkov(){
        let longitudeCoordinate = CLLocationDegrees(36.232845)
        let latitudeCoordinate = CLLocationDegrees(49.988358)
        
        let locationCoordinate2D = CLLocationCoordinate2D(latitude: latitudeCoordinate, longitude: longitudeCoordinate)
        
        let locationDistance = CLLocationDistance(10000)
        
       
        let center = MKCoordinateRegion(center: locationCoordinate2D, latitudinalMeters: locationDistance, longitudinalMeters: locationDistance)
        
        mapWhatShowKharkov.setRegion(center, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoordinateKharkov()
    }


}

