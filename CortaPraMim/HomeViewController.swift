//
//  ViewController.swift
//  CortaPraMim
//
//  Created by Michael da Costa Silva on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewServicos: UIView!
    @IBOutlet weak var agendamentosButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewServicos.layer.cornerRadius = 40
        self.agendamentosButton.layer.cornerRadius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AgendamentosSegue" {
            return
        }
        
        let destination = segue.destinationViewController as! OndeViewController
        let tipoServReq = TipoServico()
        
        switch segue.identifier! {
        case "CorteMascSegue":
            tipoServReq.idServico = 1
        case "CorteFemSegue":
            tipoServReq.idServico = 2
        case "BarbaSegue":
            tipoServReq.idServico = 3
        case "UnhaSegue":
            tipoServReq.idServico = 4
        default:
            tipoServReq.idServico = 1
        }
        
        destination.tipoServicoReq = tipoServReq
    }


}

