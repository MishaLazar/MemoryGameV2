//
//  ScoreModel.swift
//  MemoryGame_ios
//
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation

class ScoreModel : NSObject , NSCoding
{
    var userName : String
    var score : Int
    
    init (userName name:String , score: Int)
    {
        self.userName = name
        self.score = score
        
    }
    
    required init(coder decoder: NSCoder) {
        self.userName = decoder.decodeObject(forKey: "userName") as? String ?? ""
        self.score = decoder.decodeInteger(forKey: "score")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(userName, forKey: "userName")
        coder.encode(score, forKey: "score")
    }
    
}
