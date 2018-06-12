//
//  GameBoardViewController.swift
//  MemoryGame_ios
//
//  Created by admin on 11/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit
import Foundation

class GameBoardViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    var backgroundImg:UIImage = #imageLiteral(resourceName: "background")
    var userName:String = ""
    var cellsNumber:Int = 0
    var gameScore = 0
    var WiningScore = 0
    var delayCard = 1.5
    var count:Int = 10
    var timer:Timer?
    var score:Scores = Scores.init();
   
//    var t = Timer()
//    var secondsTillEndBase = 30
//    var
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    let reuseIdentifier = "GameViewCellCollectionViewCell"
    var viewModel:GameViewModel!
    //@IBOutlet var cardCell: GameViewCellCollectionViewCell!
    
    var numberOfOpenCells = 0
    var cellIndex1 = IndexPath(row: 0, section: 0)
    var cellIndex2 = IndexPath(row: 1, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        backgroundImage.image = backgroundImg
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        
        self.view.insertSubview(backgroundImage, at: 0)
        self.viewModel = GameViewModel(imageCounter:cellsNumber)
        
        WiningScore = viewModel.indexArr.count / 2 //wining score to bee acheved
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.delayCard  = self.delayCard / Double(self.cellsNumber)
        
        self.count = self.count * self.cellsNumber
        self.countDownLabel.text = String( self.count)
        self.playerNameLabel.text = self.userName
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateTimerCountLabel"), userInfo: nil, repeats: true)
        
    }
    
    
    
    // this is where you controll the amount of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.indexArr.count
    }
    
    // this is where you controll the cell content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameViewCellCollectionViewCell",
                                                      for: indexPath) as! GameViewCellCollectionViewCell
        
        let card:Card = (viewModel?.imageArr[indexPath.row])!
        
        cell.configureCell(image: card.cardImg , imageId: card.cardId  )
      
        return cell
    }
    
    // this is where you controll the cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: (UIScreen.main.bounds.width - 3 * 5)/5, height: (collectionView.frame.size.height - 3 * 10)/CGFloat(cellsNumber))
    }
    
    // this is where you controll the cell that has been touch
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you touch cell in index \(indexPath.row)")
        
        if let cell = collectionView.cellForItem(at: indexPath) as? GameViewCellCollectionViewCell{
            
            numberOfOpenCells = numberOfOpenCells + 1
            
            if numberOfOpenCells == 1 && !cell.getIsMatched() {
                cellIndex1 = indexPath
                cell.didClickOnCell()
            }else if numberOfOpenCells == 2 && !cell.getIsMatched() {
                cellIndex2 = indexPath
                cell.didClickOnCell()
                
                if (self.compareCells(cell1: collectionView.cellForItem(at: cellIndex1) as! GameViewCellCollectionViewCell, cell2: collectionView.cellForItem(at: cellIndex2) as! GameViewCellCollectionViewCell) > 0){
                    
                    if (collectionView.cellForItem(at: cellIndex1) as? GameViewCellCollectionViewCell) != nil {
                        let matchedCell = collectionView.cellForItem(at: cellIndex1) as! GameViewCellCollectionViewCell
                        matchedCell.setIsMatched()
                        self.gameScore += 1
                        
                        if(self.gameScore == self.WiningScore){
                            self.endGameByWining(message: " You WON")
                        }
                    }
                    
                } else {
                    self.delay(bySeconds: self.delayCard)
                    {
                        if let cell1 = collectionView.cellForItem(at: self.cellIndex1) as? GameViewCellCollectionViewCell {
                            
                            cell1.hideCell()
                        }
                        if let cell2 = collectionView.cellForItem(at: self.cellIndex2) as? GameViewCellCollectionViewCell {
                        
                            cell2.hideCell()
                        }
                    }
                    
                }
                
                numberOfOpenCells = 0

            }
            
          
        }
    }
    
    func compareCells(cell1:GameViewCellCollectionViewCell,cell2:GameViewCellCollectionViewCell) -> Int{
        
        var isMatched:Int = 0
        
        if(cell1.imageId == cell2.imageId){
            
            isMatched = 1
        }
     
        return isMatched
    }
    func back(){
        
              self.navigationController?.popViewController(animated: true)
        
    }
    
    func endGameByWining(message:String){
        
        let alertController = UIAlertController(title: "NICE!!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let score  = ScoreModel(userName: self.userName, score: self.count)
        ScoreManager.manager.insertScore(score: score)
//        Scores.sharedInstance.saveScores(self.userName, score: TimeInterval(self.count))
        
        alertController.addAction(UIAlertAction(title: "TRY AGAIN", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.back()
            
        })
        self.present(alertController, animated: true, completion:  nil)
        
    }
    
    func endGameByLosingToTimer(message:String){
        
        let alertController = UIAlertController(title: "OH NO! YOU LOST", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "TRY AGAIN", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.back()
            
            })
        self.present(alertController, animated: true, completion:  nil)
        
    }
    
    func stillHaveTimeToPlay() -> Bool{
        let stillHaveTime = false
        
        //check the timer
        
        return stillHaveTime
        
    }
    
    func updateTimerCountLabel() {
        if(self.count > 0) {
            self.count -= 1
            self.countDownLabel.text = String(self.count)//String(describing: )
        }else {
            timer?.invalidate()
            self.endGameByLosingToTimer(message: "Nice Try, Play Again?")
        }
    }
    
   
    
    ////////////////////////
    // copied from https://stackoverflow.com/questions/27517632/how-to-create-a-delay-in-swift
    ////////////////////////
    public func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
    
    public enum DispatchLevel {
        case main, userInteractive, userInitiated, utility, background
        var dispatchQueue: DispatchQueue {
            switch self {
            case .main:                 return DispatchQueue.main
            case .userInteractive:      return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated:        return DispatchQueue.global(qos: .userInitiated)
            case .utility:              return DispatchQueue.global(qos: .utility)
            case .background:           return DispatchQueue.global(qos: .background)
            }
        }
    }
    
}




