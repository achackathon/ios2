//
//  EstabelecimentoController.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit

class EstabelecimentoController: NSObject {
    
    
    let Estabelecimentos: [Estabelecimento] = {
        let seuElias = Estabelecimento()
        seuElias.Nome = "Salão Seu Elias"
        seuElias.Servico = TipoServicoController().Servicos[1]
        
        let maria = Estabelecimento()
        maria.Nome = "Salão Maria Elias"
        maria.Servico = TipoServicoController().Servicos[1]
        
        let cortoPinto = Estabelecimento()
        cortoPinto.Nome = "Corto & Pinto"
        cortoPinto.Servico = TipoServicoController().Servicos[3]
        
        let fabs = Estabelecimento()
        fabs.Nome = "Manicure Fabiula"
        fabs.Servico = TipoServicoController().Servicos[4]
        
        let cortFem = Estabelecimento()
        cortFem.Nome = "So corte Fem"
        cortFem.Servico = TipoServicoController().Servicos[2]
        
        let cortador = Estabelecimento()
        cortador.Nome = "Centro Cortador"
        cortador.Servico = TipoServicoController().Servicos[2]
        
        let avenue = Estabelecimento()
        avenue.Nome = "Avenue Corte Code"
        avenue.Servico = TipoServicoController().Servicos[3]
        
        let tche = Estabelecimento()
        tche.Nome = "Bah tchê"
        tche.Servico = TipoServicoController().Servicos[1]
        
        return [seuElias,maria,cortoPinto,fabs,cortFem,cortador,avenue,tche]
    }()
    
}
