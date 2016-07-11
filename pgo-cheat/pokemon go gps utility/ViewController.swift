//
//  ViewController.swift
//  pokemon go gps utility
//
//  Created by Vikram Mullick on 7/9/16.
//  Copyright © 2016 Vikram Mullick. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class ViewController: UIViewController, UITextFieldDelegate, GMSMapViewDelegate {

    @IBOutlet weak var coordinateLabel: UILabel!
    let googleDropPin = GMSMarker()
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var googleMapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructions.text = "How to Use\n1. Pick desired location on map to obtain gcoordinate\n2. Edit location.gpx file with desired gps coordinates\n3. Run app on device\n4. Switch from gps utility to Pokemon Go\n5. Go to Debug/Stimulate Location/location on xCode"
        instructions.editable=false
        googleDropPin.map = googleMapView
        addressField.delegate = self
        googleMapView.delegate = self
        
    }
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D)
    {
        addressField.resignFirstResponder()
        googleDropPin.position = coordinate
        coordinateLabel.text = String(format: "lat: %.7f long: %.7f", coordinate.latitude, coordinate.longitude)

    }
  
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        let selectedAddress = addressField.text

        CLGeocoder().geocodeAddressString(selectedAddress!,completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
          
            if let placemarks = placemarks {
                print(placemarks[0].location)
                //self.dropPin.coordinate = (placemarks[0].location?.coordinate)!
                self.googleDropPin.position = CLLocationCoordinate2DMake((placemarks[0].location?.coordinate.latitude)!, (placemarks[0].location?.coordinate.longitude)!)

                self.coordinateLabel.text = String(format: "lat: %.7f long: %.7f", (placemarks[0].location?.coordinate.latitude)!, (placemarks[0].location?.coordinate.longitude)!)

                self.googleMapView.animateToCameraPosition(GMSCameraPosition.cameraWithLatitude((placemarks[0].location?.coordinate.latitude)!,
                    longitude: (placemarks[0].location?.coordinate.longitude)!
                    , zoom: 15, bearing: 0, viewingAngle: 0))
            }
            
        })
        
        
        addressField.resignFirstResponder()
        return true
    }
   
}

