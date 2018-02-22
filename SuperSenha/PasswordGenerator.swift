//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Eduardo Tarallo on 08/02/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import Foundation

class PasswordGenerator{
    
    var numberOfCharcaters : Int
    var useCapitalLetters : Bool
    var useSmallLetters : Bool
    var useNumbers : Bool
    var useSpecialCharacters: Bool
    
    var passwords : [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "0123456789"
    private let specialCharacters = "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,"
    
    //Método Construtor da Classe
    init(numberOfCharcaters : Int, useCapitalLetters : Bool, useSmallLetters : Bool, useNumbers : Bool, useSpecialCharacters: Bool){
        
        //Lógica Caso o usuario digite numero > 16 ou insira número negativo
        var numChars = min(numberOfCharcaters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharcaters = numChars
        self.useCapitalLetters  = useCapitalLetters
        self.useSmallLetters = useSmallLetters
        self.useNumbers = useNumbers
        self.useSpecialCharacters = useSpecialCharacters
        
    }
    
    func generate(total : Int) -> [String]{
        
        passwords.removeAll()
        
        var universe : String = ""
        
        if useCapitalLetters{
            
            universe += letters.uppercased() // uppercased() -> transforma para letras maiúsculas
        }
        
        if useSmallLetters{
            
            universe += letters
        }
        
        if useNumbers{
            
            universe += numbers
        }
        
        if useSpecialCharacters{
            universe += specialCharacters
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total{
            
            var password = ""
            
            for _ in 1...numberOfCharcaters {
                
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password = password + String(universeArray[index])
            
            }
            
            passwords.append(password) // append -> adiciona elementos no final do array
        }
        
        return passwords
    }

}










