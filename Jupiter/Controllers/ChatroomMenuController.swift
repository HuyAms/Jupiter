//
//  ChatroomMenuController.swift
//  Jupiter
//
//  Created by HuyTrinh on 09/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class ChatroomMenuController: UITableViewController {
    
    let chatroomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Barack Obama", "Steve Jobs", "Taylor Swift", "Eminem"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "UNREADS"
        case 1:
            return "CHANNELS"
        default:
            return "DIRECT MESSAGES"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomGroups[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let text = chatroomGroups[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }

}
