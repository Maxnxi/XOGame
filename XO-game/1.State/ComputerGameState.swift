//
//  ComputerGameState.swift
//  XO-game
//
//  Created by Maksim on 25.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class ComputerGameState: GameState {
    var isMoveCompleted: Bool = false
    let player: Player!
    weak var gameViewControler: GameViewController?
    var gameBoard: Gameboard
    var gameBoardView: GameboardView
    var markViewPrototype: MarkView
    
    init(player: Player?, gameViewControler: GameViewController,
         gameBoard: Gameboard,
         gameboardView: GameboardView, markViewPrototype: MarkView) {
        self.player = player
        self.gameViewControler = gameViewControler
        self.gameBoard = gameBoard
        self.gameBoardView = gameboardView
        self.markViewPrototype = markViewPrototype
    }
    
    func addSign(at position: GameboardPosition) {
        
        guard !isMoveCompleted else { return }
        
        var newPosition = position
        
//        if player == .second {
//            var resultOfCheck:Bool? = nil
//            repeat {
//                let computer = ComputerDoMove(gameBoard: gameBoard)
//                let computerPosition = computer.doMove()
//                resultOfCheck = gameBoard.contains(player: player, at: [computerPosition])
//                newPosition = computerPosition
//                print("position", computerPosition)
//            } while (resultOfCheck != false)
//        }
        
        
        gameViewControler?.gameboardView.placeMarkView(markViewPrototype, at: newPosition)
        gameViewControler?.gameBoard.setPlayer(player, at: newPosition)
        
        isMoveCompleted = true
    }
    
    func begin() {
        switch player {
        case .first:
            gameViewControler?.firstPlayerTurnLabel.isHidden = false
            gameViewControler?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewControler?.firstPlayerTurnLabel.isHidden = true
            gameViewControler?.secondPlayerTurnLabel.isHidden = false
        case .none:
            break
        }
        
        gameViewControler?.winnerLabel.isHidden = true
    }
    
    
}
