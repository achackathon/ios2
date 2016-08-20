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
        }
        ////        let imageName = UIImage(named: horariosDisponiveis[indexPath.row].eventIcon + "_pin")
        ////        cell!.imageView?.image = imageName
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
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return horariosDisponiveis!.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("EventTypeCell") as UITableViewCell!
//        cell!.textLabel?.text = horariosDisponiveis![indexPath.row].hora!
////        let imageName = UIImage(named: horariosDisponiveis[indexPath.row].eventIcon + "_pin")
////        cell!.imageView?.image = imageName
//        return cell!
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        self.view.endEditing(true)
//    }
//    
}


