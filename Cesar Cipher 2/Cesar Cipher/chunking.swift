

import UIKit

class chunking: UIViewController {

    
    @IBOutlet weak var plainText: UITextField!
    
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func eliminateSpaces(text: String)->String
    {
        var mutableText = text
        for letter in text
        {
            if let i = mutableText.firstIndex(of: " ")
            {
                mutableText.remove(at: i)
            }
        }
        return mutableText
    }
    
    func actualChunking(text: String)->String
    {
        var emptyString = ""
        var x = 1
        for letter in text
        {
            if x % 4 == 0
            {
                emptyString += " "
            }
                emptyString += String(letter)
            x+=1
        }
        return emptyString
    }
    
    
    
    @IBAction func startChunking(_ sender: Any)
    {
        let plainText1 = plainText.text ?? ""
        let noSpaceText = eliminateSpaces(text: plainText1)
        let finalOutput = actualChunking(text: noSpaceText)
        outputLabel.text = finalOutput
        
    }

}
