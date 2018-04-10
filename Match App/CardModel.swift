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
        
        // declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // randomly generate pairs of cards
        while generatedNumbersArray.count < 8{
            
            let randomNumber = arc4random_uniform(13) + 1
            
            // ensure the random number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
            
            // log the number
            print(randomNumber)
                
            // store the number into the generatedNumbersArray
            generatedNumbersArray.append(Int(randomNumber))
            
            // create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardOne)
            
            // create the second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)
            }
        }
        
        // randomize the array
        for i in 0...generatedCardsArray.count {
         
        // find the random index to swap with
        let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
        
        // swap the two cards
        let temporaryStorage = generatedCardsArray[i]
        generatedCardsArray[i] = generatedCardsArray[randomNumber]
        generatedCardsArray[randomNumber] = temporaryStorage
        
        }
        
        // return the array
        return generatedCardsArray
        
        
    }
}
