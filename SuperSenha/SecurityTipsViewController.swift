//
//  SecurityTipsViewController.swift
//  SuperSenha
//
//  Created by Eduardo Tarallo on 08/02/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class SecurityTipsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    //MARK: - Actions
    @IBAction func close(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil) //Método para fechar uma tela modal
        
    }
    
}
