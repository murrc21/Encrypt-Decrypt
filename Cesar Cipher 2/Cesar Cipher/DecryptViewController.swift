//
//  DecryptViewController.swift
//  Cesar Cipher
//
//  Created by Charlie Murr on 3/17/20.
//  Copyright © 2020 stx. All rights reserved.
//

import UIKit

class DecryptViewController: UIViewController {

    
    let plainAlphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "9", "8", "7", "6", "5", "4", "3", "2", "1"]
    
    @IBOutlet weak var encryptedTextField: UITextField!
    
    
    @IBOutlet weak var shiftTextField: UITextField!
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func cesarDecrypt(message encryptedText: String, shift: Int)->String
    {
        
        //var placeHolder: Int = 0
        
        var plainText = ""
        
        if shift < 0
        {
            print("shift must be positive")
            return plainText
        }
        
        if shift == nil
        {
            print("shift must be a number")
            return plainText
        }
        
        for letter in encryptedText
        {
            
            let letterIndex = plainAlphabet.firstIndex(of: String(letter))
        
        if letterIndex != nil
         {
           plainText.append(plainAlphabet[letterIndex! - shift])
         }
           
            else
            {
            plainText.append(letter)
            }
            
        }
        
        
        
        
        return plainText
    }
    
    
    @IBAction func decrypt(_ sender: Any)
    {
        let cipherText = encryptedTextField.text ?? ""
        let shift = Int(shiftTextField.text ?? "0")
        
        if cipherText != ""
        {
        let plainText = cesarDecrypt(message: cipherText, shift: shift!)
        outputLabel.text = plainText
        }
        
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
