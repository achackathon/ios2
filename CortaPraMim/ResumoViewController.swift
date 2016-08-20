//
//  ResumoViewController.swift
//  CortaPraMim
//
//  Created by Henrique Rodrigues Araujo on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit
import GoogleMaps

class ResumoViewController: UIViewController {
    @IBOutlet weak var localAgendamento: UILabel!
    @IBOutlet weak var horarioAtendimento: UILabel!
    @IBOutlet weak var precoAgendamento: UILabel!
    @IBOutlet weak var servicoAgendado: UILabel!
    
    var agendamento: Agendamento!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localAgendamento.text = agendamento.NomeEstabelecimento
        horarioAtendimento.text = String(agendamento.Horario)
        precoAgendamento.text = "R$" + String(agendamento.Valor)
        servicoAgendado.text = agendamento.Servico
    }
    
}
