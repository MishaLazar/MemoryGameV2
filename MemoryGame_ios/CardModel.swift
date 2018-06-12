//
//  CardModel.swift
//  MemoryGame_ios
//
//  Created by user135819 on 6/12/18.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation
import UIKit
class CardModel : NSObject , NSCoding
{
    var cardName : String
    var img : UIImage
    
    init (cardName:String , img: UIImage)
    {
        self.cardName = cardName
        self.img = img
        
    }
    
    required init(coder decoder: NSCoder) {
        self.cardName = decoder.decodeObject(forKey: "cardName") as? String ?? ""
        self.img = decoder.decodeObject(forKey: "img") as! UIImage
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cardName, forKey: "cardName")
        coder.encode(img, forKey: "img")
    }
    
}
