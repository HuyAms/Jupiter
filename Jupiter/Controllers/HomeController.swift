//
//  ViewController.swift
//  Jupiter
//
//  Created by HuyTrinh on 07/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//
import UIKit

class HomeController: UITableViewController {
    
    let menuController = MenuController()
    
    fileprivate let menuWitdh: CGFloat = 300
    fileprivate let velocityOpenThreshold: CGFloat = 500
    fileprivate var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.red
        
        setupNavigationItem()
        
        setupMenuController()
        
        //Pan Gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    

    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            var x = translation.x
            
            if isMenuOpen {
                x += menuWitdh
            }
            
            x = min(menuWitdh, x)
            x = max(0, x)
            
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuController.view.transform = transform
            navigationController?.view.transform = transform
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpen {
            
            if abs(velocity.x) > velocityOpenThreshold {
                handleHide()
                return
            }
            
            if abs(translation.x) < menuWitdh / 2 {
                handleOpen()
            } else {
                handleHide()
            }
        } else {
            
            if velocity.x > velocityOpenThreshold {
                handleOpen()
                return
            }
            
            if translation.x < menuWitdh / 2 {
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
    @objc func handleOpen() {
        
        isMenuOpen = true
        
        performAnimations(tranform: CGAffineTransform(translationX: self.menuWitdh, y: 0))
    }
    
    @objc func handleHide() {
        
        isMenuOpen = false
        
        performAnimations(tranform: .identity)
        
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
    }
    
    // MARK: - Fileprivate
    
    fileprivate func performAnimations(tranform: CGAffineTransform) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Final position
            self.menuController.view.transform = tranform
//            self.view.transform = tranform
            self.navigationController?.view.transform = tranform
        })
    }
    
    fileprivate func setupNavigationItem() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupMenuController() {
        //Initial position
        menuController.view.frame = CGRect(x: -menuWitdh, y: 0, width: menuWitdh, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        addChild(menuController)
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

