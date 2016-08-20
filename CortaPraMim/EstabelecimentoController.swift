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
        
        let fabs1 = Estabelecimento()
        fabs1.Nome = "Unha fabulosa"
        fabs1.Servico = TipoServicoController().Servicos[3]
        fabs1.location = CLLocationCoordinate2D(latitude: -19.933719, longitude: -43.935053)
        fabs1.Valor = 32.0
        
        let fabs2 = Estabelecimento()
        fabs2.Nome = "Unha fabulosa"
        fabs2.Servico = TipoServicoController().Servicos[3]
        fabs2.location = CLLocationCoordinate2D(latitude: -19.933119, longitude: -43.935953)
        fabs2.Valor = 32.0
        
        let seuElias1 = Estabelecimento()
        seuElias1.Nome = "Salão do Macarrão"
        seuElias1.Servico = TipoServicoController().Servicos[0]
        seuElias1.location = CLLocationCoordinate2D(latitude: -19.934898, longitude: -43.933365)
        seuElias1.Valor = 93.34
        
        let maria1 = Estabelecimento()
        maria1.Nome = "Salão Linda"
        maria1.Servico = TipoServicoController().Servicos[0]
        maria1.location = CLLocationCoordinate2D(latitude: -19.936485, longitude: -43.9324676)
        maria1.Valor = 233.44
        
        let seuElias2 = Estabelecimento()
        seuElias2.Nome = "Salão Dirceu"
        seuElias2.Servico = TipoServicoController().Servicos[0]
        seuElias2.location = CLLocationCoordinate2D(latitude: -19.934698, longitude: -43.933485)
        seuElias2.Valor = 93.34
        
        let maria2 = Estabelecimento()
        maria2.Nome = "Salão Marta"
        maria2.Servico = TipoServicoController().Servicos[0]
        maria2.location = CLLocationCoordinate2D(latitude: -19.936035, longitude: -43.932616)
        maria2.Valor = 23.44
        
        return [seuElias,maria,cortoPinto,fabs,cortFem,cortador,avenue,tche,fabs2,fabs1,seuElias1,seuElias2,maria1,maria2]
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



