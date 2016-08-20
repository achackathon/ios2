//
//  AgendamentoController.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit

class AgendamentoController  {
    
    class func getHorariosDisponiveis(estabelecimento: Estabelecimento) -> [Horario] {
        
        var listaHorarios = [Horario]()
        for i in 8...22 {
            let h = Horario()
            h.hora = i
            listaHorarios.append(h)
        }
        
        
        var listaDoEstabelecimento =  [Agendamento]()
        for ag in AppDelegate.listaAgendamento {
            if ag.NomeEstabelecimento == estabelecimento.Nome {
                listaDoEstabelecimento.append(ag)
            }
        }
        
        for age in listaDoEstabelecimento {
            for h in listaHorarios {
                if age.Hora == h.hora {
                    h.Ocupado = true;
                }
            }
        }
       return listaHorarios
    }
    
    class func setAgendamento(agendamento: Agendamento) {
        AppDelegate.listaAgendamento.append(agendamento)
    }
    
}