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
        seuElias.Servico = TipoServicoController().Servicos[0]
        seuElias.location = CLLocationCoordinate2D(latitude: -19.934698, longitude: -43.933775)
        seuElias.Valor = 93.34
        
        let maria = Estabelecimento()
        maria.Nome = "Salão Maria Elias"
        maria.Servico = TipoServicoController().Servicos[0]
        maria.location = CLLocationCoordinate2D(latitude: -936485, longitude: -43.932606)
        maria.Valor = 233.44
        
        let cortoPinto = Estabelecimento()
        cortoPinto.Nome = "Corto & Pinto"
        cortoPinto.Servico = TipoServicoController().Servicos[2]
        cortoPinto.location = CLLocationCoordinate2D(latitude: -19.933741, longitude: -43.932091)
        cortoPinto.Valor = 3.50
        
        let fabs = Estabelecimento()
        fabs.Nome = "Manicure Fabiula"
        fabs.Servico = TipoServicoController().Servicos[3]
        fabs.location = CLLocationCoordinate2D(latitude: -19.933519, longitude: -43.935653)
        fabs.Valor = 12.0
        
        let cortFem = Estabelecimento()
        cortFem.Nome = "So corte Fem"
        cortFem.Servico = TipoServicoController().Servicos[1]
        cortFem.location = CLLocationCoordinate2D(latitude: -19.933005, longitude: -43.932746)
        cortFem.Valor = 148.53
        
        let cortador = Estabelecimento()
        cortador.Nome = "Centro Cortador"
        cortador.Servico = TipoServicoController().Servicos[1]
        cortador.location = CLLocationCoordinate2D(latitude: -19.938587, longitude: -43.933628)
        cortador.Valor = 10.00
        
        let avenue = Estabelecimento()
        avenue.Nome = "Avenue Corte Code"
        avenue.Servico = TipoServicoController().Servicos[2]
        avenue.location = CLLocationCoordinate2D(latitude: -19.937343, longitude: -43.936715)
        avenue.Valor = 593.19
        
        let tche = Estabelecimento()
        tche.Nome = "Bah tchê"
        tche.Servico = TipoServicoController().Servicos[0]
        tche.location = CLLocationCoordinate2D(latitude: -19.939313, longitude: -43.936237)
        tche.Valor = 69.69
        
        return [seuElias,maria,cortoPinto,fabs,cortFem,cortador,avenue,tche]
    }()
    
    
    class func getEstabelecimento(local: CLLocationCoordinate2D) -> [Estabelecimento] {
        return MeusEstabelecimentos
    }
    
    class func getEstabelecimentoPorServico(tipoServico: Int, local: CLLocationCoordinate2D) -> [Estabelecimento]{
        var estabs = [Estabelecimento]()
        for estab in MeusEstabelecimentos {
            if  estab.Servico.idServico == tipoServico {
                estabs.append(estab)
            }
        }
        return estabs
        
    }
    
}



