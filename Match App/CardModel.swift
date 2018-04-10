//
//  CardModel.swift
//  Match App
//
//  Created by Sam Richardson on 4/1/18.
//  Copyright © 2018 Sam Richardson. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // declase an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // randomly generate pairs of cards
        for _ in 1...8{
            
            let randomNumber = arc4random_uniform(13) + 1
            
            // log the number
            print(randomNumber)
            
            // create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardOne)
            
            // create the second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)
            // OPTIONAL: make it so we only have unique pairs of cards
        }
        
        // randomize the array
        
        // return the array
        return generatedCardsArray
        
        
    }
}
