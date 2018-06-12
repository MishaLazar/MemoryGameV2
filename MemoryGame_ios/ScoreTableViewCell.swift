//
//  ScoreTableViewCell.swift
//  MemoryGame_ios
//
//  Created by admin on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    
    func confgureCell(score:ScoreModel){
        
        self.lblName.text = score.userName
        self.lblScore.text = "\(score.score)"
        
    }
    
}
