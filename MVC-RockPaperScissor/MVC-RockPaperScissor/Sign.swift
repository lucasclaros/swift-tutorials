//
//  Sign.swift
//  MVC-RockPaperScissor
//
//  Created by Lucas da Silva Claros on 01/03/23.
//

func randomSign() -> Sign {
    let options: [Sign] = [Sign.rock, Sign.scissors, Sign.paper]
    return options.randomElement()!
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
            case .rock: return "👊"
            case .paper: return "✋"
            case .scissors: return "✌️"
        }
    }

    func play(opponentSign: Sign) -> GameState {
        switch self {
            case .rock:
            switch opponentSign {
                case .rock: return GameState.draw
                case .paper: return GameState.lose
                case .scissors: return GameState.win
            }
            case .paper:
            switch opponentSign {
                case .rock: return GameState.win
                case .paper: return GameState.draw
                case .scissors: return GameState.lose
            }
            case .scissors:
            switch opponentSign {
                case .rock: return GameState.lose
                case .paper: return GameState.win
                case .scissors: return GameState.draw
            }
        }
    }
}
