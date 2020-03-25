//
//  EncryptViewController.swift
//  Cesar Cipher
//
//  Created by Murr Charles on 3/12/20.
//  Copyright © 2020 stx. All rights reserved.
//

import UIKit

class EncryptViewController: UIViewController {
   
    let plainAlphabet =
["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    
    @IBOutlet var plainTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func encrypt(_ sender: Any) {
        func cesarEncrypt(message plainText: String, cesarShift: Int)->String
        {
            let cipherAlphabet = generateCipherAlphabet(shift: cesarShift)
            var cipherText = ""
            
            if cesarShift < 0
            {
                print("shift must be positive")
                return plainText
            }
            for letter in plainText
            {
               let letterIndex = plainAlphabet.firstIndex(of: String(letter))
                if letterIndex != nil
                {
                     cipherText.append(cipherAlphabet[letterIndex!])
                    
                }
                    
                else
                {
                    cipherText.append(letter) //passes thru original character
                }
               
            }
        return cipherText
    }
    }
    

    //TASK #1: Complete the below function which takes a shift and returns the shifted alphabet as a list.  For example, if the shift were 3 then the shifted alphabet would be ["d", "e", "f", ... , "a", "b", "c"]
    func generateCipherAlphabet(shift:Int)->[String]
    {
        var cipherAlphabet = plainAlphabet
        
        for _ in 0..<shift
        {
            var firstLetter = cipherAlphabet.removeFirst()
            cipherAlphabet.append(firstLetter)
        }
        return cipherAlphabet
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

