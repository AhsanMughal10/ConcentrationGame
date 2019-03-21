//
//  Card.swift
//  Lab1
//
//  Created by Ahsan Mughal on 25/01/2019.
//  Copyright © 2019 Ahsan Mughal. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
     var turnedoveronce : Bool = false 
    var identifier : Int
    
    static var identifierfactory = 0
    
    static func getuniqueidentifier()->Int{
        identifierfactory+=1
        return identifierfactory
    }
    
    
    init()
    {
       self.identifier = Card.getuniqueidentifier()
    }
}
 
