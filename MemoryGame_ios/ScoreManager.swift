//
//  ScoreManager.swift
//  MemoryGame_ios
//
//  Created by Harel Avikasis on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation

let kScoreKey = "scores"
let kPointsKey = "points"

class ScoreManager
{
    static let manager = ScoreManager()
    
    var scores = [ScoreModel]()
    var userPoints : Int = 0
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Scores")
    
    func fetchScores()
    {
        self.scores = NSKeyedUnarchiver.unarchiveObject(withFile: ScoreManager.archiveURL.path) as? [ScoreModel] ?? [ScoreModel]()
        self.scores = self.scores.sorted(by: { $0.score > $1.score })
    }
    
    func getThelowestScore() -> ScoreModel?
    {
        var returnScore : ScoreModel? = nil
        var lowestScore = scores.first?.score
        scores.forEach({ (score) in
            
            if score.score <= lowestScore!
            {
                lowestScore = score.score
                returnScore = score
            }
        })
        return returnScore
    }
    
    func getTheHighstScore() -> ScoreModel?
    {
        var returnScore : ScoreModel? = nil
        var higherScore = scores.first?.score
        scores.forEach({ (score) in
            
            if score.score >= higherScore!
            {
                higherScore = score.score
                returnScore = score
            }
        })
        return returnScore
    }
    
    func insertScore(score : ScoreModel)
    {
        var index = 0
        for (i, internalScore) in (scores.enumerated())
        {
            if score.score >= internalScore.score
            {
                index = i
            }
        }
        
        scores.insert(score, at: index)
        self.scores = self.scores.sorted(by: { $0.score > $1.score })
        if (scores.count) > 10
        {
            scores.removeLast()
        }
        saveData()
    }
    
    func saveData()
    {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(scores, toFile: ScoreManager.archiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save Scores...")
        }else{
            print("Kalu Kaley!!!")
        }
    }
}
