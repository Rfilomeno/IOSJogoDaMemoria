//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Rodrigo Filomeno on 27/12/2017.
//  Copyright © 2017 Rodrigo Filomeno. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUnicIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUnicIdentifier()
    }
    
}
