//
//  ViewController.swift
//  ios-two-player-fighter
//
//  Created by Adam Goth on 6/24/16.
//  Copyright © 2016 Adam Goth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textDisplay: UILabel!
    
    @IBOutlet weak var playerOneHp: UILabel!
    
    @IBOutlet weak var playerTwoHp: UILabel!
    
    @IBOutlet weak var playerOneAttackBtn: UIButton!
    
    @IBOutlet weak var playerOneAttackLbl: UILabel!
    
    @IBOutlet weak var playerTwoAttackBtn: UIButton!
    
    @IBOutlet weak var playerTwoAttackLbl: UILabel!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    @IBOutlet weak var restartLbl: UILabel!
    
    @IBOutlet weak var playerOneImg: UIImageView!
    
    @IBOutlet weak var playerTwoImg: UIImageView!
    
    var player1: Player!
    var player2: Player!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }
    
    func startGame() {
        player1 = Player(name: "Player 1", startingHp: 100, attackPower: 20)
        player2 = Player(name: "Player 2", startingHp: 100, attackPower: 20)
        playerOneHp.text = "\(player1.hp) HP"
        playerTwoHp.text = "\(player2.hp) HP"
        textDisplay.text = "Press Attack to begin!"
    }

    func disableButtons() {
        playerOneAttackBtn.hidden = true
        playerOneAttackLbl.hidden = true
        playerTwoAttackBtn.hidden = true
        playerTwoAttackLbl.hidden = true
        
        if player1.isAlive && player2.isAlive {
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.unhideAttackButtons), userInfo: nil, repeats: false)
        } else {
            restartBtn.hidden = false
            restartLbl.hidden = false
        }
    }
    
    func unhideAttackButtons() {
        playerOneAttackBtn.hidden = false
        playerOneAttackLbl.hidden = false
        playerTwoAttackBtn.hidden = false
        playerTwoAttackLbl.hidden = false
    }
    
    @IBAction func onPlayerOneAttack(sender: AnyObject) {
        player2.attacked(player1.attackPower)
        if player2.isAlive {
            textDisplay.text = "\(player1.name) attacks \(player2.name) for \(player1.attackPower) HP"
            playerTwoHp.text = "\(player2.hp) HP"
        } else {
            playerTwoImg.hidden = true
            textDisplay.text = "\(player1.name) has defeated \(player2.name)"
            playerTwoHp.text = "0 HP"
        }
        
        disableButtons()
        
    }

    @IBAction func onPlayerTwoAttack(sender: AnyObject) {
        player1.attacked(player2.attackPower)
        if player1.isAlive {
            textDisplay.text = "\(player2.name) attacks \(player1.name) for \(player2.attackPower) HP"
            playerOneHp.text = "\(player1.hp) HP"
        } else {
            playerOneImg.hidden = true
            textDisplay.text = "\(player2.name) has defeated \(player1.name)"
            playerOneHp.text = "0 HP"
        }
        
        disableButtons()
        
    }
    
    @IBAction func onRestartPressed(sender: AnyObject) {
        playerOneImg.hidden = false
        playerOneAttackBtn.hidden = false
        playerOneAttackLbl.hidden = false
        playerTwoImg.hidden = false
        playerTwoAttackBtn.hidden = false
        playerTwoAttackLbl.hidden = false
        restartBtn.hidden = true
        restartLbl.hidden = true
        
        startGame()
    }
    
}

