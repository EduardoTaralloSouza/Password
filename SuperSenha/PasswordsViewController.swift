//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Eduardo Tarallo on 08/02/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tvPasswords: UITextView!
    

    //MARK: - Propriedades
    var numberOfPasswords  : Int = 1  //Define a quantidade minima de caracteres, caso usuário não digite.
    var numberOfCharcaters : Int = 10 //Define a quantidade minima de caracteres, caso usuário não digite.
    var useCapitalLetters : Bool!
    var useSmallLetters : Bool!
    var useNumbers : Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator : PasswordGenerator!
    
    //MARK: - Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de Senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharcaters: numberOfCharcaters, useCapitalLetters: useCapitalLetters, useSmallLetters: useSmallLetters, useNumbers: useNumbers, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }

    func generatePasswords(){
        
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    
    //MARK: - Actions
    @IBAction func generate(_ sender: UIButton) {
        
        generatePasswords()
    }
    

}
