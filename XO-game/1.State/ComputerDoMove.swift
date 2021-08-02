//
//  ComputerDoMove.swift
//  XO-game
//
//  Created by Maksim on 25.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class ComputerDoMove {
    
    var gameBoard = Gameboard()
    
    
    init(gameBoard: Gameboard){
        self.gameBoard = gameBoard
    }
    
    func doMove() -> GameboardPosition {
        let row = Int.random(in: 0..<3)
        let column = Int.random(in: 0..<3)
        let position = GameboardPosition(column: column, row: row)
        return position
    }
}
