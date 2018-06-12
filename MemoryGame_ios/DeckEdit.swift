//
//  Deck.swift
//  MemoryGame_ios
//
//  Created by user135819 on 6/11/18.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation
import UIKit

let kDeckUserDefaultsKey = "Deck"

class DeckEdit  {
    
    static let manager = DeckEdit()
    var customDeckArr = [CardModel]()
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Deck")
    
    func getCutomDeckArr() -> [CardModel] {
       // self.customDeckArr =  userDefaults().array(forKey: kDeckUserDefaultsKey) as? [Card] ?? []
        fetchCustomDeck()
        return self.customDeckArr
    }
    

    func fetchCustomDeck()
    {
        self.customDeckArr = NSKeyedUnarchiver.unarchiveObject(withFile: DeckEdit.archiveURL.path) as? [CardModel] ?? [CardModel]()
        
    }
    
    func addCustomeCardToDeck(card:CardModel) {
        self.customDeckArr.append(card)
        saveDeck()
    }
    
    func saveCustomeDeck(newDeck:[CardModel]){
        
        self.customDeckArr = newDeck
        
    }
    fileprivate func userDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func saveDeck()
    {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(customDeckArr, toFile: DeckEdit.archiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save Scores...")
        }else{
            print("Kalu Kaley!!!")
        }
    }
    
    func restToDefault(){
        self.customDeckArr = [CardModel]()
        saveDeck()
    }
}
