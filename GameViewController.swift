//
//  GameViewController.swift
//  TicTacToeGame
//
//  Created by Tamanna Khan on 2022-09-18.
//

import UIKit

class GameViewController: UIViewController {
    
    // variables
    @IBOutlet weak var lblPlayerName1: UILabel!
    @IBOutlet weak var lblPlayerName2: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    // Instance of Game class
    var game = Game(getName1: "", getName2: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting players name with textfield strings
        lblPlayerName1.text = game.getName1
        lblPlayerName2.text = game.getName2
    }
    
    
    @IBAction func box(_ sender: UIButton) {
        
        // Checks through tags if its empty "0" and that the game is active
        if (game.state[sender.tag-1] == 0 && game.gameIsOn == true){
            
            // The tag gets the current player number in array
            game.state[sender.tag-1] = game.currentPlayer
            
            if (game.currentPlayer == 1) {
                sender.setImage(UIImage(named: "cross"), for: UIControl.State())
                
                game.currentPlayer = 2
            }else{
                sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                
                game.currentPlayer = 1
            }
        }
        
        for combos in game.winComb{
            
            // Checks that the combos does not contain 0 and if any of the combos contains 1 or 2
            if game.state[combos[0]] != 0 && game.state[combos[0]] == game.state[combos[1]] && game.state[combos[1]] == game.state[combos[2]]{
                game.gameIsOn = false
                
                if game.state[combos[0]] == 1{
                    lblResult.text = "\(lblPlayerName1.text ?? "") is the winner!"
                }else{
                    lblResult.text = "\(lblPlayerName2.text ?? "") is the winner!"
                }
                
                btnPlayAgain.isHidden = false
                lblResult.isHidden = false
                dispatcher()
            }
        }
        
        game.gameIsOn = false
        
        // As long there is no combos matched, the game is still on
        for i in game.state {
            if i == 0 {
                game.gameIsOn = true
            }
        }
        
        // It becomes a draw if there is no winner, meaning no boxes left to fill in
        if game.gameIsOn == false {
            lblResult.text = "It is a draw!"
            lblResult.isHidden = false
            btnPlayAgain.isHidden = false
            dispatcher()
        }
    }
    
    // Play again button, reset the state to 0
    @IBAction func playAgain(_ sender: UIButton) {
        
        game.state = [0,0,0,0,0,0,0,0,0]
        game.gameIsOn = true
        game.currentPlayer = 1
        
        btnPlayAgain.isHidden = true
        lblResult.isHidden = true
        
        
    }
    
    //Dispatcher to clear the played board after 3 seconds
    func dispatcher(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            // for loop to set the images to nil to start over the game
            for i in 1...9 {
                let btn = self.view.viewWithTag(i) as! UIButton
                btn.setImage(UIImage(), for: UIControl.State())
            }
        }
    }
}
