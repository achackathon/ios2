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
    var tipoServicoReq : TipoServico?
    var estabelecimentoSel : Estabelecimento?
    var placeHolder = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        placeHolder.icon = UIImage(named: "placeholder")
        placeHolder.title = "Você"
        placeHolder.groundAnchor = CGPoint(x: 0.5, y: 1)
        placeHolder.appearAnimation = kGMSMarkerAnimationPop
        placeHolder.map = self.mapView
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    
    //MARK: - Maps & Location methods
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        mapView.myLocationEnabled = false
        mapView.settings.myLocationButton = false
        
        if let location = locations.first! as CLLocation! {
            
            placeHolder.position = location.coordinate
            
            listaEstabelecimentos = EstabelecimentoController.getEstabelecimentoPorServico(self.tipoServicoReq!.idServico!, local: location.coordinate)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
                
                for item in self.listaEstabelecimentos! {
                    let marker = PlaceMarker(estabelecimento: item)
                    //marker.position = CLLocationCoordinate2DMake(item.location.latitude, item.location.longitude)
                    marker.title = item.Nome
                    marker.snippet = "Tipo de Serviço: \(item.Servico.NomeServico!)\nValor: R$ \(item.Valor.format(".2"))"
                    marker.map = self.mapView
                }
            })
        }
    }
    
    func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        
        if marker == self.placeHolder {
            return true
        }
        
        let estab = marker as! PlaceMarker
        self.estabelecimentoSel = estab.estabelecimento

        return false
    }
    
    func mapView(mapView: GMSMapView, didTapInfoWindowOfMarker marker: GMSMarker) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "quandoSegue" {
            if let destinationViewController = segue.destinationViewController as? QuandoViewController {
                destinationViewController.estabelecimentoSel = self.estabelecimentoSel
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "quandoSegue" {
            
            if self.estabelecimentoSel == nil {
                
                let alerta = UIAlertView(title: "Atenção", message: "Você precisa selecionar um estabelecimento.", delegate: nil, cancelButtonTitle: "OK!")
                alerta.show()
                return false
            }
        }
        
        return true
    }
}