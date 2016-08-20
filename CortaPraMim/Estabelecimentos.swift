//
//  Estabelecimentos.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit
import GoogleMaps

class Estabelecimento: NSObject {
    
    var Nome: String
    var Servico: TipoServico
    var Valor: Double
    var location: CLLocationCoordinate2D
    
    override init() {
        Nome = ""
        Servico = TipoServicoController().Servicos[0]
        Valor = 0
        location = CLLocationCoordinate2D(latitude: -1, longitude: -1)
    }
    
}