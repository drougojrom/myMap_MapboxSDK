//
//  ViewController.swift
//  myMap_MapBoxSDK
//
//  Created by Roman Ustiantcev on 18/05/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit
import Mapbox
import MapboxGeocoder
import MapboxDirections

class MapViewController: UIViewController {

    @IBOutlet var mapView: MGLMapView!
    
    var arrayHelper = [String]()
    let geocoder = MBGeocoder(accessToken: "pk.eyJ1IjoiZHJvdWdvanJvbSIsImEiOiJjaW9janJkazcwMDV0dmptNWsxczRocTl0In0.w4hQl8U5yQdOqstMG5z6Xg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 55.760278, longitude: 37.618611)
        point.title = "Большой театр"
        point.subtitle = "Москва, Россия"
        
        let task = geocoder.geocodeAddressString(arrayHelper.first!, completionHandler: { (placemarks, error) in
        
            
            placemarks?.count
            let addressPlacemark = placemarks![0]
            print(addressPlacemark)
            print(placemarks)
        })
        
        print(task)
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

