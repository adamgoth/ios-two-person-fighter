//
//  Player.swift
//  ios-two-player-fighter
//
//  Created by Adam Goth on 6/25/16.
//  Copyright © 2016 Adam Goth. All rights reserved.
//

import Foundation

class Player {
    private var _name: String = "Player"
    private var _hp: Int = 0
    private var _attackPower: Int = 20
    
    var name: String {
        get {
            return _name
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        if hp <= 0 {
            return false
        } else {
            return true
        }
    }
    
    init(name: String, startingHp: Int, attackPower: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPower = attackPower
    }
    
    func attacked(attackPower: Int) {
        self._hp -= attackPower
    }
}
