//
//  ViewController.swift
//  Match App
//
//  Created by Sam Richardson on 3/31/18.
//  Copyright © 2018 Sam Richardson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call the getCards method of the card model
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a CardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        // set that card for the cell
        cell.setCard(card)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false{
            
            // flip the card
            cell.flip()
            card.isFlipped = true
            
            // determine if it's the first card or second card that's flipped over
            if firstFlippedCardIndex == nil {
                // this is the first card being flipped
                firstFlippedCardIndex = indexPath
                
            }
            else {
                // this is the second card being flipped
                
                // TODO: Perform the matching logic
                checkForMatches(indexPath)
            }
        }
    } // end of the didSelectItemAt method
    
    // MARK: - Game Logic Methods
    func checkForMatches(_ secondFlippedCardIndex:IndexPath) {
        // get the cells for the two cards that were revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        // get the cards for the two cards that were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            
            // it's a match
            
            // set the statuses of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            //remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
        }
        else {
            // it's not a match
            
            // set the status
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            // flip both cards back
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        
        
        firstFlippedCardIndex = nil
    }
    
} // end of the ViewController class

