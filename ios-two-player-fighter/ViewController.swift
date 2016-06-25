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
    
    var player1: Player!
    var player2: Player!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Player(name: "Player 1", startingHp: 50, attackPower: 20)
        player2 = Player(name: "Player 2", startingHp: 50, attackPower: 20)
        playerOneHp.text = "\(player1.hp) HP"
        playerTwoHp.text = "\(player2.hp) HP"
        textDisplay.text = "Press Attack to begin!"
    }
    
    
    @IBAction func onPlayerOneAttack(sender: AnyObject) {
        player2.attacked(player1.attackPower)
        if player2.isAlive {
            textDisplay.text = "\(player1.name) attacks \(player2.name) for \(player1.attackPower) HP"
            playerTwoHp.text = "\(player2.hp) HP"
        } else {
            textDisplay.text = "\(player1.name) has defeated \(player2.name)"
            playerTwoHp.text = "0 HP"
        }
    }

    @IBAction func onPlayerTwoAttack(sender: AnyObject) {
        player1.attacked(player2.attackPower)
        if player1.isAlive {
            textDisplay.text = "\(player2.name) attacks \(player1.name) for \(player2.attackPower) HP"
            playerOneHp.text = "\(player1.hp) HP"
        } else {
            textDisplay.text = "\(player2.name) has defeated \(player1.name)"
            playerOneHp.text = "0 HP"
        }
        
    }
}

