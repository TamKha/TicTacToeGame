//
//  Game.swift
//  TicTacToeGame
//
//  Created by Tamanna Khan on 2022-09-18.
//

import Foundation

class Game {
    
    // Variables for player name
    var getName1: String?
    var getName2: String?
    
    var currentPlayer = 1 // Starts with X
    var state = [0,0,0,0,0,0,0,0,0]
    
    // Possible winning combinations
    let winComb = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsOn = true
    
    
    init(getName1: String, getName2: String) {
        self.getName1 = getName1
        self.getName2 = getName2
    }

}
