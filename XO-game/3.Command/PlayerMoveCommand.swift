//
//  PlayerMoveCommand.swift
//  XO-game
//
//  Created by Maksim on 26.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class PlayerMoveCommand {
    let player: Player
    let position: GameboardPosition
    let gameBoard: Gameboard
    
    let receiverGameBoard = Gameboard()
    let receiverGameBoardView = GameboardView()
    
    
    init(player: Player, position: GameboardPosition, gameBoard: Gameboard) {
        self.player = player
        self.position = position
        self.gameBoard = gameBoard
    }
        
    func execute() {
        print("command executed", self.player)
        receiverGameBoardView.placeMarkView(self.player.markViewPrototype, at: self.position)
        receiverGameBoard.setPlayer(self.player, at: self.position)
        
    }
    
}
