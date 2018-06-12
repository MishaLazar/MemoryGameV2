//
//  GameViewCellCollectionViewCell.swift
//  MemoryGame_ios
//
//  Created by admin on 11/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class GameViewCellCollectionViewCell: UICollectionViewCell {
    
    var isMatced = false
    var backCardImg:UIImage = #imageLiteral(resourceName: "pokeball_BackCard")
    var imageId:Int?
    
    @IBOutlet var imageViewA: UIImageView!
    var frontImage : UIImage?
    func configureCell(image:UIImage? ,imageId:Int?){
        self.frontImage = image
        self.imageId = imageId
        self.imageViewA.image = backCardImg
      
    }
    
    func didClickOnCell(){
        self.imageViewA.image = self.frontImage
         UIView.transition(with: self.imageViewA, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    func hideCell (){
        self.imageViewA.image = backCardImg
        UIView.transition(with: self.imageViewA, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewA.image = nil
    }
    func setIsMatched(){
        self.isMatced = true
        
    }
    func getIsMatched () -> Bool{
        return self.isMatced
    }

    
}
