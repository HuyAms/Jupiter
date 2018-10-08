//
//  BaseSlidingControler.swift
//  Jupiter
//
//  Created by HuyTrinh on 08/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class RightContainerView: UIView {}
class MenuContainerView: UIView {}
class DarkCoverView: UIView {}

class BaseSlidingController: UIViewController {
    
    let rightContainerView: RightContainerView = {
        let v = RightContainerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let menuContainerView: MenuContainerView = {
        let v = MenuContainerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let darkCoverView: DarkCoverView = {
        let v = DarkCoverView()
        v.alpha = 0
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        
        setupPanGesture()
    }

    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityOpenThreshold: CGFloat = 500
    fileprivate var isMenuOpen = false
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpen ? x + menuWidth : x
        
        x = min(menuWidth, x)
        x = max(0, x)

        redViewLeadingConstraint.constant = x
        darkCoverView.alpha = x / menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpen {
            if abs(velocity.x) > velocityOpenThreshold {
                closeMenu()
                return
            }
            
            if abs(translation.x) < menuWidth / 2 {
                openMenu()
            } else {
                closeMenu()
            }
        } else {
            if velocity.x > velocityOpenThreshold {
                closeMenu()
                return
            }
            
            if translation.x < menuWidth / 2 {
                closeMenu()
            } else {
                openMenu()
            }
        }
    }
    
    fileprivate func setupViews() {
        view.addSubview(rightContainerView)
        view.addSubview(menuContainerView)
        
        //Auto layout
        NSLayoutConstraint.activate([
            rightContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            rightContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            menuContainerView.trailingAnchor.constraint(equalTo: rightContainerView.safeAreaLayoutGuide.leadingAnchor),
            menuContainerView.widthAnchor.constraint(equalToConstant: menuWidth),
            menuContainerView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor)
            ])
        
        redViewLeadingConstraint = rightContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
        
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        //Add HomeControllers into the redView        
        let menuController = MenuController()
        
        let homeView = rightViewController.view!
        let menuView = menuController.view!

        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        rightContainerView.addSubview(homeView)
        rightContainerView.addSubview(darkCoverView)
        menuContainerView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: rightContainerView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
            
            darkCoverView.topAnchor.constraint(equalTo: rightContainerView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: menuContainerView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: menuContainerView.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: menuContainerView.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: menuContainerView.trailingAnchor),
            ])
        
        addChild(rightViewController)
        addChild(menuController)
    }
    
    func openMenu() {
        isMenuOpen = true
        redViewLeadingConstraint.constant = menuWidth
        performAnimations()
    }
    
    func closeMenu() {
        isMenuOpen = false
        redViewLeadingConstraint.constant = 0
        performAnimations()
    }
    
    func didSelectMenuItem(indexPath: IndexPath) {
        
        performRightViewCleanUp()
        closeMenu()
        
        switch indexPath.row {
        case 0:
            rightViewController = UINavigationController(rootViewController: HomeController())
        case 1:
            rightViewController = UINavigationController(rootViewController: ListController())
        case 2:
            rightViewController = BookMarkController()
        default:
            let tabBarController = UITabBarController()
            let mommentsController = UIViewController()
            mommentsController.navigationItem.title = "Momments"
            
            let navController = UINavigationController(rootViewController: mommentsController)
            navController.tabBarItem?.title = "Momments"
            
            tabBarController.viewControllers = [navController]
            rightViewController = tabBarController
        }
        
        rightContainerView.addSubview(rightViewController.view)
        addChild(rightViewController)
        
        rightContainerView.bringSubviewToFront(darkCoverView)
    }
    
    var rightViewController: UIViewController = UINavigationController(rootViewController: HomeController())
    
    fileprivate func performRightViewCleanUp() {
        rightViewController.view.removeFromSuperview()
        rightViewController.removeFromParent()
    }
    
    fileprivate func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = self.isMenuOpen ? 1 : 0
        })
    }
}
