//
//  ViewController.swift
//  myMap_MapBoxSDK
//
//  Created by Roman Ustiantcev on 18/05/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    @IBOutlet var mapView: MGLMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 55.760278, longitude: 37.618611)
        point.title = "Большой театр"
        point.subtitle = "Москва, Россия"
        
        mapView.addAnnotation(point)
        
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

