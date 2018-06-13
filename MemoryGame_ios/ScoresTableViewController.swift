//
//  ScoresTableViewController.swift
//  MemoryGame_ios
//
//  Created by admin on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {
    
   
    
    var scores: [[String:String]] = [[:]]
    var backgroundImg:UIImage = #imageLiteral(resourceName: "background")
    var userName:String = ""
    var BImage:UIImage = #imageLiteral(resourceName: "ArrowToLeft")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
//        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = backgroundImg
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.tableView.backgroundView = backgroundImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScoreManager.manager.scores.count//scores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath as IndexPath) as! ScoreTableViewCell
        
        // Configure the cell...
        let score = ScoreManager.manager.scores[indexPath.row]
        cell.confgureCell(score: score)
        cell.backgroundColor = .clear
        return cell

    }
    
    
    //////////----- KUSSSSOOOMOOOOOO ZOT LO HAMETODA TAMBAL!
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath as IndexPath) as! ScoreTableViewCell
//
//        // Configure the cell...
//        let score = ScoreManager.manager.scores[indexPath.row]
//        cell.confgureCell(score: score)
//
//        return cell
//    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        cell?.detailTextLabel?.isHidden = false
    }
    
    
}
