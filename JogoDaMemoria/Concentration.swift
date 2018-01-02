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
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
            
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    func ChoseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.ChoseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                //either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "init(\(numberOfPairsOfCards)): you must have at least 1 pair of cards")
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
