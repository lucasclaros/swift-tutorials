//
//  GameState.swift
//  MVC-RockPaperScissor
//
//  Created by Lucas da Silva Claros on 01/03/23.
//

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
            case .start: return "🤖"
            case .win: return "You win! =D"
            case .lose: return "You lose! =("
            case .draw: return "Draw! =O"
        }
    }
    
}
