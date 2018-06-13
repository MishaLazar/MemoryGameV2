//
//  SelectLevelViewController.swift
//  MemoryGame_ios
//
//  Created by admin on 11/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class SelectLevelViewController: UIViewController {
    
    var backgroundImg:UIImage = #imageLiteral(resourceName: "background")
    var userName:String = ""
    var BImage:UIImage = #imageLiteral(resourceName: "ArrowToLeft")
    @IBOutlet weak var welcomeLabel:UILabel!
    
    @IBOutlet weak var btnL1:UIButton!
    @IBOutlet weak var btnL2:UIButton!
    @IBOutlet weak var btnL3:UIButton!
    @IBOutlet weak var btnScoreBoard:UIButton!
    @IBOutlet weak var btnCustomizeDeck: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = backgroundImg
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        
        self.view.insertSubview(backgroundImage, at: 0)        // Do any additional setup after loading the view.
        
        
        btnL1.setBackgroundImage(BImage, for: UIControlState.normal)
        btnL2.setBackgroundImage(BImage, for: UIControlState.normal)
        btnL3.setBackgroundImage(BImage, for: UIControlState.normal)
        btnScoreBoard.setBackgroundImage(BImage, for: UIControlState.normal)
        btnCustomizeDeck.setBackgroundImage(BImage, for: UIControlState.normal)
        welcomeLabel.text = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setGameLevel(_ sender:UIButton){
        
        var cellsNumber:Int = 0
        
        if let btnId:Int = sender.tag
        {
            switch btnId {
            case 1:
                cellsNumber = 3
                
            case 2:
                cellsNumber = 4
               
            case 3:
                cellsNumber = 5
            default:
                cellsNumber = 3
            }
        }
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "GameBoardViewController") as? GameBoardViewController {

            vc.userName = self.userName
            vc.cellsNumber = cellsNumber
            
            //self.present(vc, animated: true, completion:nil)
            //var navi = UINavigationController(rootViewController: vc)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        

    }
    
    @IBAction func OpenGameScoresBoard(_ sender: Any) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ScoresTableViewController") as? ScoresTableViewController {
            
            //self.present(vc, animated: true, completion:nil)
            //var navi = UINavigationController(rootViewController: vc)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
 
    @IBAction func OpenCustomCardEditor(_ sender: Any) {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DeckEditViewController") as? DeckEditViewController {
            
            //self.present(vc, animated: true, completion:nil)
            //var navi = UINavigationController(rootViewController: vc)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }   
}
