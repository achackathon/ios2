//
//  Agendamento.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//


import UIKit

class Agendamento: NSObject {
    
    var NomeEstabelecimento: String?
    var Servico: String?
    var Valor: Double?
    var Dia: NSDate?
    var Hora: Int? 
    var Marcado: Bool?
    
    
}


class Horario {
    var hora: Int?
    var Ocupado: Bool?
    
}