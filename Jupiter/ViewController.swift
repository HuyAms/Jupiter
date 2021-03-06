//
//  ViewController.swift
//  Jupiter
//
//  Created by HuyTrinh on 07/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.red
        
        setupNavigationItem()
    }
    
    @objc func handleOpen() {
        print("Open..")
        
        let vc = MenuController()
        
        vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(vc.view)
    }
    
    @objc func handleHide() {
        print("Hide..")
    }
    
    fileprivate func setupNavigationItem() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}

