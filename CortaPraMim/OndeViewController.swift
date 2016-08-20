//
//  OndeViewController.swift
//  CortaPraMim
//
//  Created by Michael da Costa Silva on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit
import GoogleMaps

class OndeViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate  {
    
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    var listaEstabelecimentos : [Estabelecimento]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }

    
    //MARK: - Maps & Location methods
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        
        if let location = locations.first! as CLLocation! {
            listaEstabelecimentos = EstabelecimentoController.getEstabelecimento(location.coordinate)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
                
                for item in self.listaEstabelecimentos! {
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2DMake(item.location!.latitude, item.location!.longitude)
                    marker.title = item.Nome
                    //marker.snippet = "Australia"
                    marker.map = self.mapView
                }
            })
        }
    }
    
    func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        
        return false
    }
    
    func mapView(mapView: GMSMapView, didTapInfoWindowOfMarker marker: GMSMarker) {

    }
}