//
//  InvokerPlayerMoveCommand.swift
//  XO-game
//
//  Created by Maksim on 26.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class InvokerPlayerMoveCommand {
    public static let shared = InvokerPlayerMoveCommand()
    
    
    
    var commands: [PlayerMoveCommand] = []
    let bufferSize = 10
    
    private init() {
        
    }
    
    func addCommand(command: PlayerMoveCommand) {
        self.commands.append(command)
        print("Command added", command)
        execute()
    }
    

    func execute() {
        guard commands.count >= bufferSize else { return }
        
        commands.forEach { $0.execute() }
        commands = []
    }
}
