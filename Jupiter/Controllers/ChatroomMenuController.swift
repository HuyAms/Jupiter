//
//  ChatroomMenuController.swift
//  Jupiter
//
//  Created by HuyTrinh on 09/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

extension ChatroomMenuController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredResults = chatroomGroups
            tableView.reloadData()
            return
        }
        
//        var result = [[String]]()
        
//        chatroomGroups.forEach { (group) in
//
//            let filteredGroup = group.filter({ (chatroomName) -> Bool in
//                return chatroomName.lowercased().contains(searchText.lowercased())
//            })
//
//            result.append(filteredGroup)
//        }
//
//        filteredResults = result
        
        filteredResults = chatroomGroups.map({ (group) -> [String] in
            return group.filter {$0.lowercased().contains(searchText.lowercased())}
        })
        tableView.reloadData()
    }
}

class ChatroomMenuController: UITableViewController {
    
    let chatroomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Barack Obama", "Steve Jobs", "Taylor Swift", "Eminem"]
    ]
    
    var filteredResults = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredResults = chatroomGroups
        
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
        return filteredResults.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResults[section].count
    }
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatroomHeaderLabel()
        let text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        label.text = text
        label.textColor = #colorLiteral(red: 0.6470588235, green: 0.5647058824, blue: 0.6392156863, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell()
        let text = filteredResults[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [.foregroundColor: #colorLiteral(red: 0.6470588235, green: 0.5647058824, blue: 0.6392156863, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSMutableAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        
        cell.textLabel?.attributedText = attributedText
        
        
        return cell
    }

}
