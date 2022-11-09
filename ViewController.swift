//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Tamanna Khan on 2022-09-18.
//

import UIKit

class ViewController: UIViewController {
    
    // variables
    @IBOutlet weak var txtPlayerName1: UITextField!
    @IBOutlet weak var txtPlayerName2: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    // Variable of segue identifier
    var mySegue = "mySegue"
    
    // Instance of Game class
    var game = Game(getName1: "", getName2: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onStart(_ sender: UIButton) {
        
        let name1 = txtPlayerName1.text
        let name2 = txtPlayerName2.text
        
        // Checks that both fields are filled, then it can navigate to the game
        if (name1 != "") && (name2 != "") {
            self.performSegue(withIdentifier: mySegue, sender: self)
        }else{
            lblError.isHidden = false
            lblError.text = "You need to fill in both fields!"
        }
    }
    
    // Takes the player name from textfield and passing it into the labels in game view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == mySegue {
            let destinationVC = segue.destination as! GameViewController
            
            destinationVC.game.getName1 = txtPlayerName1.text
            destinationVC.game.getName2 = txtPlayerName2.text
        }
    }
}

