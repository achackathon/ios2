//
//  PlaceMarker.swift
//  CortaPraMim
//
//  Created by Michael da Costa Silva on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
    let estabelecimento: Estabelecimento
    
    init(estabelecimento:Estabelecimento) {
        self.estabelecimento = estabelecimento
        super.init()
        position = estabelecimento.location
        //icon = UIImage(named: place.icon!+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}
