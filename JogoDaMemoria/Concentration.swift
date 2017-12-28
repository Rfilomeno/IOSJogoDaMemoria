//
//  Concentration.swift
//  JogoDaMemoria
//
//  Created by Rodrigo Filomeno on 27/12/2017.
//  Copyright © 2017 Rodrigo Filomeno. All rights reserved.
//

import Foundation
import UIKit

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func ChoseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
         }
        
        //TODO: Shuffle the cards
        var cardsShuffle = [Card]()
        for _ in 0..<cards.count{
         cardsShuffle.append(cards.remove(at: Int(arc4random_uniform(UInt32(cards.count)))))
        }
        cards = cardsShuffle
    }
    
}
