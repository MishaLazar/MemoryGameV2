//
//  Card.swift
//  MemoryGame_ios
//
//  Created by admin on 12/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation
import UIKit

class Card {

    var cardIndex:Int?
    var cardId:Int?
    var cardPicName:String?
    var cardImg:UIImage?
    
    
    
    
    init(cardIndex:Int? , cardId:Int? , cardPicName:String) {
        self.cardIndex = cardIndex
        self.cardId = cardId
        self.cardPicName = cardPicName
        
        if self.cardPicName != "picName" {
            self.cardImg = UIImage(named: self.cardPicName!) ?? #imageLiteral(resourceName: "back")
        }
        
    }
    
    func setCardImg(img:UIImage){
        self.cardImg = img
    }
    
    func getCardIndex() -> Int{
        
        return self.cardId!
        
    }
    
    func getCardId() -> Int{
        
        return self.cardIndex!
        
    }
    
    func getCardPicName () -> String{
        
        return self.cardPicName!
    }
    
    func getCardImage() ->UIImage{
        
        return self.cardImg!
    }
    
    
}
