//
//  Concentration.swift
//  Lab1
//
//  Created by Ahsan Mughal on 25/01/2019.
//  Copyright © 2019 Ahsan Mughal. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    var theme = Theme()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipcount: Int = 0
    var score : Int = 0
    var timeAtPress : Date? = Date()
    var timeatnextPress :Date? = Date()
    


    
    
    func chooseCard(at index: Int) {
       timeAtPress = timeatnextPress // Getting time of first move
        print("Time :",timeAtPress!)
        self.flipcount =  self.flipcount + 1
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score+=2
                        timeatnextPress = Date() // Getting time of next move
                        getDifference(latertime: timeatnextPress, earliertime: timeAtPress) // Getting Time Difference

                   
                }else{
                      timeatnextPress = Date() // Getting time of next move
                    getDifference(latertime: timeatnextPress, earliertime: timeAtPress) // Getting Time Difference
                    if cards[index].turnedoveronce == true{ // Checking if card is seen once before
                        score-=1
                    }
                    if cards[matchIndex].turnedoveronce == true{ // Checking if card is seen once before
                        score-=1
                    }
                    cards[index].turnedoveronce = true
                    cards[matchIndex].turnedoveronce = true
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                  timeatnextPress = Date() // Getting time of next move
                getDifference(latertime: timeatnextPress, earliertime: timeAtPress) // Getting Time Difference
                
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
                
                
            }
        }
        
    }
    // MARK: Bonus Credit
    // Penalizing Score on basis of time difference between last move and current move
    func getDifference(latertime: Date? , earliertime : Date?)
    {
        
        let elapsed = latertime!.timeIntervalSince(earliertime!)
        score = score +  ( Int(elapsed) / 2 ) // Penalizing Formula
        
        print(Int(elapsed))
        
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            print (card.identifier)
            cards += [card, card]
         
        }
        // TODO: Shuffle the cards
        
        cards.shuffle()
        
    }
}
