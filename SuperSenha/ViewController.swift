//
//  ViewController.swift
//  SuperSenha
//
//  Created by Eduardo Tarallo on 06/02/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSmallLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    
    //MARK: - Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tfTotalPasswords.delegate = self
        tfNumberOfCharacters.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfTotalPasswords.text = ""
        tfNumberOfCharacters.text = ""
    }

    
    //Como que eu faço antes de uma tela ser apresentada, alimenta-la com informações
    //Toda ViewController possui um método chamado prepare for segue, esse método sempre é executado momentos antes da segue apresentar a nova tela.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let passwordsViewController = segue.destination as! PasswordsViewController// destination -> informa qual é a View destino deste segue.
        
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            
            passwordsViewController.numberOfCharcaters = numberOfCharacters
        }
        
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSmallLetters = swSmallLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        view.endEditing(true) // Metodo que encerra o modo de edição, tira o foco do text field e desaparece o teclado.
        
    }
    
    //Método para desaparecer o teclado quando clicar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //Método para Ir para próxima textField quando clicar na tecla return do teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Coloca o foco no próximo textField
        if textField == tfTotalPasswords{
            tfNumberOfCharacters.becomeFirstResponder()
        } else if textField == tfNumberOfCharacters{
            view.endEditing(true)
        }
        return true
    }
}


//MARK: - Extensão
extension ViewController : UITextFieldDelegate{
    
}



