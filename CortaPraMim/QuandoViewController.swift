//
//  QuandoViewController.swift
//  CortaPraMim
//
//  Created by Michael da Costa Silva on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import Foundation
import UIKit

class QuandoViewController: UIViewController {
    
    var estabelecimentoSel : Estabelecimento?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "voltarLocalSegue" {
            if let destinationViewController = segue.destinationViewController as? OndeViewController {
                destinationViewController.tipoServicoReq = self.estabelecimentoSel!.Servico
            }
        }
    }
    
}