//
//  Scores.swift
//  MemoryGame_ios
//
//  Created by admin on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation


let kScoresUserDefaultsKey = "Scores"

class Scores {
    static let sharedInstance = Scores()
    
    func getScores() -> [Dictionary<String,String>] {
        return userDefaults().array(forKey: kScoresUserDefaultsKey) as? [Dictionary<String,String>] ?? []
    }
    
    func saveScores(_ name: String, score: TimeInterval) {
        let entry = ["name": name, "score": String(score)]
              var scores = getScores()
        scores.append(entry)
        
        let sortedScores = scores.sorted { (entry1, entry2) -> Bool in
            var rtn =  false

            let n1:String = entry1["score"]!
            let n2:String = entry2["score"]!
            
          
            
            var  d2 = Float(n2)
            var  d1 = Float(n1)
            var d3 = d2! - d1!
            
            
            if d3 > 0 {
               rtn = true
            }
            
            return rtn
            
        }
        
        if scores.count > 10 {
            scores.removeLast()
        }
        
        userDefaults().set(sortedScores, forKey: kScoresUserDefaultsKey)
    }
    
    fileprivate func userDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
}
