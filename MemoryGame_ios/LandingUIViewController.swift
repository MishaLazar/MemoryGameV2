//
//  LandingUIViewController.swift
//  MemoryGame_ios
//
//  Created by admin on 11/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class LandingUIViewController: UIViewController {
    
    var backgroundImg:UIImage = #imageLiteral(resourceName: "background")
    var lImageBackground:UIImage = #imageLiteral(resourceName: "boardTiltToSide")
    var BImage:UIImage = #imageLiteral(resourceName: "ArrowToRight")
    @IBOutlet weak var UserName:UITextField!
    @IBOutlet weak var LImg: UIImageView!
    @IBOutlet weak var BtnStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = backgroundImg
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        LImg.image = lImageBackground
      
    BtnStart.setBackgroundImage(BImage, for: UIControlState.normal)
        UserName.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startGame(_ sender:UIButton){
        
       
        
        if (UserName.text != "")
        {
               var storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let vc = storyboard.instantiateViewController(withIdentifier: "SelectLevelViewController") as? SelectLevelViewController {
                
                    print(UserName.text)
                   vc.userName = UserName.text!
                   //self.present(vc, animated: true, completion:nil)
                
                self.navigationController?.pushViewController(vc, animated: true)
                }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
