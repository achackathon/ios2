//
//  TipoServicoController.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit


class TipoServicoController {
    
    let Servicos: [TipoServico] = {
        
        let cortMas = TipoServico()
        cortMas.idServico = 1
        cortMas.NomeServico = "Corte Masc."
        cortMas.icon = "corteMasc"
        
        let cortFem = TipoServico()
        cortFem.idServico = 2
        cortFem.NomeServico = "Corte Fem."
        cortFem.icon = "corteFem"
        
        let Barba = TipoServico()
        Barba.idServico = 3
        Barba.NomeServico = "Barba"
        Barba.icon = "barba"
        
        let Unha = TipoServico()
        Unha.idServico = 4
        Unha.NomeServico = "Unha"
        Unha.icon = "unha"
        
        return [cortMas,cortFem,Barba,Unha]
        
        
    }()
    
    
    
}
