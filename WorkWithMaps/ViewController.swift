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
        
        addAnnotation()
    }
    
    
    //func for add annotation
    func addAnnotation(){
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(longress(gesture:)))
        uilpgr.minimumPressDuration = 2
        mapWhatShowKharkov.addGestureRecognizer(uilpgr)
    }
    
    @objc func longress(gesture: UIGestureRecognizer){
        let touchPoint = gesture.location(in: self.mapWhatShowKharkov)
        let coordinate = mapWhatShowKharkov.convert(touchPoint, toCoordinateFrom: self.mapWhatShowKharkov)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Maybe i will go here too..."
        mapWhatShowKharkov.addAnnotation(annotation)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoordinateKharkov()
    }


}

