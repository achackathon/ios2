//
//  AgendaController.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit

class AgendaController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ListaHorario: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListaHorario.dataSource = self
        ListaHorario.delegate = self
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.listaAgendamento.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HorarioCell") as UITableViewCell!
        let agen = AppDelegate.listaAgendamento[indexPath.row]
        cell!.textLabel?.text = "\(agen.Servico?.NomeServico)! - \(agen.NomeEstabelecimento) - R$ \(agen.Valor?.format(".2"))"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        horarioSelecionado = horariosDisponiveis![indexPath.row].hora
        
    }
}



