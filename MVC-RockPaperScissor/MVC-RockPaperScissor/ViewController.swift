//
//  ViewController.swift
//  MVC-RockPaperScissor
//
//  Created by Lucas da Silva Claros on 01/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playerRockSign: UIButton!
    @IBOutlet weak var playerPaperSign: UIButton!
    @IBOutlet weak var playerScissorsSign: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIState(uiState: .start)
    }
    
    func updateUIState(uiState: GameState) {
        switch uiState {
        case .start:
            view.backgroundColor = .darkGray
            playAgainButton.isHidden = true
            gameStatus.text = "Rock, Paper or Scissors?"
            appSign.text = uiState.message
            enableSignButtons()
        case .win:
            view.backgroundColor = .systemGreen
            playAgainButton.isHidden = false
            disableSignButtons()
        case .lose:
            view.backgroundColor = .systemRed
            playAgainButton.isHidden = false
            disableSignButtons()
        case .draw:
            view.backgroundColor = .systemBlue
            playAgainButton.isHidden = false
            disableSignButtons()
        }
    }

    @IBAction func onRockSignTap(_ sender: UIButton) {
        play(userSign: Sign.rock)
    }
    
    @IBAction func onPaperSignTap(_ sender: UIButton) {
        play(userSign: Sign.paper)
    }
    
    @IBAction func onScissorsSignTap(_ sender: Any) {
        play(userSign: Sign.scissors)
    }
    
    @IBAction func onPlayAgainTap(_ sender: UIButton) {
        updateUIState(uiState: .start)
    }
    
    func play(userSign: Sign) {
        let appRandomSign = randomSign()
        let result = userSign.play(opponentSign: appRandomSign)
        
        appSign.text = appRandomSign.emoji
        gameStatus.text = result.message
        
        updateUIState(uiState: result)
    }
    
    func disableSignButtons() {
        playerRockSign.isEnabled = false
        playerRockSign.isHidden = true
        
        playerPaperSign.isEnabled = false
        playerPaperSign.isHidden = true
        
        playerScissorsSign.isEnabled = false
        playerScissorsSign.isHidden = true
        
    }
    
    func enableSignButtons() {
        playerRockSign.isEnabled = true
        playerRockSign.isHidden = false
        
        playerPaperSign.isEnabled = true
        playerPaperSign.isHidden = false
        
        playerScissorsSign.isEnabled = true
        playerScissorsSign.isHidden = false
    }
    
}

