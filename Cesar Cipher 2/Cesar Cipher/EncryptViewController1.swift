//
//  EncryptViewController1.swift
//  Cesar Cipher
//
//  Created by Charlie Murr on 3/17/20.
//  Copyright © 2020 stx. All rights reserved.
//

import UIKit

class EncryptViewController1: UIViewController {
    
    
    
    let plainAlphabet =
        ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "9", "8", "7", "6", "5", "4", "3", "2", "1"]
    
    
    @IBOutlet weak var plainTextField: UITextField!
    
    
    @IBOutlet weak var shiftTextField: UITextField!
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
    
    
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
    
    
    
    @IBAction func encrypt() {
        
        let plainText = plainTextField.text ?? ""
        let shift = Int(shiftTextField.text ?? "0")
        let cipherText = cesarEncrypt(message: plainText, cesarShift: shift!)
        outputLabel.text = cipherText
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
