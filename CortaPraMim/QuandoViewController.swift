//
//  QuandoViewController.swift
//  CortaPraMim
//
//  Created by Michael da Costa Silva on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.


import UIKit

class QuandoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ListaHorario: UITableView!
    @IBOutlet weak var NomeEstabelecimento: UILabel!
    @IBOutlet weak var ServicoAgendamento: UILabel!
    @IBOutlet weak var ValorAgendamento: UILabel!
    var estabelecimentoSel : Estabelecimento?
    var horariosDisponiveis: [Horario]?
    var horarioSelecionado: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let estab = estabelecimentoSel {
            NomeEstabelecimento.text = estab.Nome
            ServicoAgendamento.text = estab.Servico.NomeServico
            ValorAgendamento.text = "R$ " + String(estab.Valor.format(".2"))
        }
        ListaHorario.dataSource = self
        ListaHorario.delegate = self
        horariosDisponiveis = AgendamentoController.getHorariosDisponiveis(estabelecimentoSel!)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horariosDisponiveis!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HorarioCell") as UITableViewCell!
        if let horario = horariosDisponiveis {
            cell!.textLabel?.text = String(horario[indexPath.row].hora!) + ":00"
            if let bloqueado = horario[indexPath.row].Ocupado {
                if bloqueado {
                    cell!.backgroundColor = UIColor.grayColor()
                    cell!.userInteractionEnabled = false
                    cell!.textLabel?.text = String(horario[indexPath.row].hora!) + ":00 -  Ocupado"
                    
                }
            }
        }
        //cell!.textLabel?.textAlignment = .Center
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        horarioSelecionado = horariosDisponiveis![indexPath.row].hora
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResumoSegue" {
            if let destinationViewController = segue.destinationViewController as? ResumoViewController {
                destinationViewController.estabelecimentoSel = self.estabelecimentoSel
                destinationViewController.horarioSelecionado = self.horarioSelecionado
            }
        } else if segue.identifier == "voltarLocalSegue"{
            if let destinationViewController = segue.destinationViewController as? OndeViewController {
                destinationViewController.estabelecimentoSel = self.estabelecimentoSel
                destinationViewController.tipoServicoReq = self.estabelecimentoSel!.Servico
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "ResumoSegue" {
            
            if self.estabelecimentoSel == nil {
                
                let alerta = UIAlertView(title: "Atenção", message: "Você precisa selecionar um horário.", delegate: nil, cancelButtonTitle: "OK!")
                alerta.show()
                return false
            }
        }
        
        return true
    }
}


