//
//  GameScoreTable.swift
//  MemoryGame_ios
//
//  Created by admin on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import Foundation


class GameScoreUITableViewController: UIViewController {

    @IBOutlet weak var TableScore: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
    }

    func AddItemsToTableView() {
        
       
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField = alert.textFields?.first,
                                            let nameToSave = textField.text else {
                                                return
                                        }
                                        
                                        self.names.append(nameToSave)
                                        self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "Cell",
                                              for: indexPath)
            cell.textLabel?.text = names[indexPath.row]
            return cell
    }
}
