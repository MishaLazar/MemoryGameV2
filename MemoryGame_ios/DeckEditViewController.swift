//
//  DeckEditViewController.swift
//  MemoryGame_ios
//
//  Created by user135819 on 6/11/18.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class DeckEditViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var backgroundImg:UIImage = #imageLiteral(resourceName: "background")
    var userName:String = ""
    var BImage:UIImage = #imageLiteral(resourceName: "ArrowToLeft")
    @IBOutlet weak var btnSaveDeck: UIButton!
    @IBOutlet weak var btnAddImage: UIButton!
    
    @IBOutlet weak var btnResetDeck: UIButton!
    var imageData:[CardModel] = [CardModel]()
    var imageCounter: Int = 0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = backgroundImg
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        imageData = DeckEdit.manager.getCutomDeckArr()
        btnAddImage.setBackgroundImage(BImage, for: UIControlState.normal)
        btnResetDeck.setBackgroundImage(BImage, for: UIControlState.normal)
        btnSaveDeck.setBackgroundImage(BImage, for: UIControlState.normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageData = DeckEdit.manager.getCutomDeckArr()
    
        collectionView.reloadData()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeckEditCollectionViewCell", for: indexPath) as! DeckEditCollectionViewCell
        cell.backgroundColor = UIColor.black
      
        if self.imageData.count > 0 {
            
            cell.CellImage.image = self.imageData[self.imageCounter].img
            self.imageCounter += 1
        }
        
       
        if self.imageCounter >= self.imageData.count {
            self.imageCounter = 0
        }
        
        
        return cell
        
        
    }
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageData.count
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
        
    }
    
    @IBAction func resetDeck(_ sender: Any) {
        DeckEdit.manager.restToDefault()
        //        collectionView.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveDeck(_ sender: Any) {
        DeckEdit.manager.saveDeck()
    }
    
    @IBAction func AddImage(_ sender: Any) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CustomCardView") as? CustomCardViewController {
            
            //self.present(vc, animated: true, completion:nil)
            //var navi = UINavigationController(rootViewController: vc)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
