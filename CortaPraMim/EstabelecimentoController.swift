//
//  EstabelecimentoController.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit
import GoogleMaps

class EstabelecimentoController: NSObject {
    
    
    static let MeusEstabelecimentos: [Estabelecimento] = {
        let seuElias = Estabelecimento()
        seuElias.Nome = "Salão Seu Elias"
        seuElias.Servico = TipoServicoController().Servicos[1]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.934698, longitude: -43.933775)
        
        let maria = Estabelecimento()
        maria.Nome = "Salão Maria Elias"
        maria.Servico = TipoServicoController().Servicos[1]
        seuElias.location = CLLocationCoordinate2D(latitude: -936485, longitude: -43.932606)
        
        let cortoPinto = Estabelecimento()
        cortoPinto.Nome = "Corto & Pinto"
        cortoPinto.Servico = TipoServicoController().Servicos[3]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.933741, longitude: -43.932091)
        
        let fabs = Estabelecimento()
        fabs.Nome = "Manicure Fabiula"
        fabs.Servico = TipoServicoController().Servicos[4]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.933519, longitude: -43.935653)
        
        let cortFem = Estabelecimento()
        cortFem.Nome = "So corte Fem"
        cortFem.Servico = TipoServicoController().Servicos[2]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.933005, longitude: -43.932746)
        
        let cortador = Estabelecimento()
        cortador.Nome = "Centro Cortador"
        cortador.Servico = TipoServicoController().Servicos[2]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.938587, longitude: -43.933628)
        
        let avenue = Estabelecimento()
        avenue.Nome = "Avenue Corte Code"
        avenue.Servico = TipoServicoController().Servicos[3]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.937343, longitude: -43.936715)
        
        let tche = Estabelecimento()
        tche.Nome = "Bah tchê"
        tche.Servico = TipoServicoController().Servicos[1]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.939313, longitude: -43.936237)
        
        return [seuElias,maria,cortoPinto,fabs,cortFem,cortador,avenue,tche]
    }()
    
    
    class func getEstabelecimento(local: CLLocationCoordinate2D) -> [Estabelecimento] {
        return MeusEstabelecimentos
    }
    
}



