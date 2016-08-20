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
    
    @IBOutlet weak var imgServico: UIImageView!
    var estabelecimentoSel : Estabelecimento?
    var horarioSelecionado: Int?
    
    @IBAction func finalizar(sender: AnyObject) {
        
        let agendamento = Agendamento()
        agendamento.Dia = NSDate()
        agendamento.Hora = horarioSelecionado
        if let estab = estabelecimentoSel {
            agendamento.NomeEstabelecimento = estab.Nome
            agendamento.Servico = estab.Servico
            agendamento.Valor = estab.Valor
            agendamento.Marcado = true
            
        }
        
        AgendamentoController.setAgendamento(agendamento)
        
        
        let alert = UIAlertController(title: "Corta pra mim", message: "Pedido finalizado com sucesso!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{ (UIAlertAction) in
            let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TelaInicial")
            
            self.presentViewController(nextVC, animated: true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    var agendamento: Agendamento!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localAgendamento.text = estabelecimentoSel?.Nome
        if let hora = horarioSelecionado {
            horarioAtendimento.text = "20/08/2016 " +  String(hora) + ":00"
        }
        
        imgServico.image = UIImage(named: estabelecimentoSel!.Servico.icon!)
        
        if let val = estabelecimentoSel?.Valor {
         precoAgendamento.text = "Valor R$ " + String(val)
        }
        servicoAgendado.text = estabelecimentoSel?.Servico.NomeServico
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "voltarQuandoSegue"{
            if let destinationViewController = segue.destinationViewController as? QuandoViewController {
                destinationViewController.estabelecimentoSel = self.estabelecimentoSel
            }
        }
    }
    
}
