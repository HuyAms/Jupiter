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
    
    let menuController = MenuController()
    
    fileprivate let menuWitdh: CGFloat = 300
    
    @objc func handleOpen() {
        
        //Initial position
        menuController.view.frame = CGRect(x: -menuWitdh, y: 0, width: menuWitdh, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Final position
            self.menuController.view.transform = CGAffineTransform(translationX: self.menuWitdh, y: 0)
        }, completion: nil)
        
        addChild(menuController)
        
    }
    
    @objc func handleHide() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Final position
            self.menuController.view.transform = .identity
        }, completion: nil)
        
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
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

