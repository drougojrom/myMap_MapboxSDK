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

class MapViewController: UIViewController, MGLMapViewDelegate {

    @IBOutlet var mapView: MGLMapView!
    
    var arrayHelper = [String]()
    let geocoder = MBGeocoder(accessToken: "pk.eyJ1IjoiZHJvdWdvanJvbSIsImEiOiJjaW9janJkazcwMDV0dmptNWsxczRocTl0In0.w4hQl8U5yQdOqstMG5z6Xg")
    
    var addressPlacemarkOne = MBPlacemark()
    var addressPlacemarkTwo = MBPlacemark()
    
    let pointOne = MGLPointAnnotation()
    let pointTwo = MGLPointAnnotation()
    var myRoute: MBRoute?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findLocations(pointOne, pointTwo: pointTwo)
        
    }
    
    
    // find locations using geocoding
    func findLocations(pointOne: MGLPointAnnotation, pointTwo: MGLPointAnnotation) {
        
        let taskOne = geocoder.geocodeAddressString(arrayHelper.first!, completionHandler: { (placemarks, error) in
            
            
            placemarks?.count
            self.addressPlacemarkOne = placemarks![0]
            
            pointOne.coordinate = CLLocationCoordinate2D(latitude: (self.addressPlacemarkOne.location?.coordinate.latitude)!, longitude: (self.addressPlacemarkOne.location?.coordinate.longitude)!)
            pointOne.title = self.addressPlacemarkOne.name
            pointOne.subtitle = self.addressPlacemarkOne.country
            print(self.addressPlacemarkOne)
            print(placemarks)
            self.mapView.addAnnotation(pointOne)
        })
        
        let taskTwo = geocoder.geocodeAddressString(arrayHelper.last!, completionHandler: { (placemarks , error) in
            
            placemarks?.count
            self.addressPlacemarkTwo = placemarks![0]
            pointTwo.coordinate = CLLocationCoordinate2D(latitude: (self.addressPlacemarkTwo.location?.coordinate.latitude)!, longitude: (self.addressPlacemarkTwo.location?.coordinate.longitude)!)
            pointTwo.title = self.addressPlacemarkTwo.name
            pointTwo.subtitle = self.addressPlacemarkTwo.country
            print(self.addressPlacemarkTwo)
            self.mapView.addAnnotation(pointTwo)
        })
        
        
        print(taskOne)
        print(taskTwo)
        
    }
    
    func mapView(mapView: MGLMapView, lineWidthForPolylineAnnotation annotation: MGLPolyline) -> CGFloat {
        return 5
    }
    
    @IBAction func drawRoute(sender: UIBarButtonItem) {
        
        let directionsRequest = MBDirectionsRequest(sourceCoordinate: pointOne.coordinate, destinationCoordinate: pointTwo.coordinate)
        directionsRequest.transportType = .Automobile
        
        let directions = MBDirections(request: directionsRequest, accessToken: "pk.eyJ1IjoiZHJvdWdvanJvbSIsImEiOiJjaW9janJkazcwMDV0dmptNWsxczRocTl0In0")
        
        
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

