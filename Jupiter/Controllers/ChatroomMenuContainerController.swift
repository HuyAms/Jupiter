//
//  ChatroomMenuContainerController.swift
//  Jupiter
//
//  Created by HuyTrinh on 09/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class ChatroomMenuContainerController: UIViewController {
    
    let chatroomMenuController = ChatroomMenuController()
    
    let searchContainer = UIView()
    let profileImageView = ProfileImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
        
        let chatroomsView = chatroomMenuController.view!
        chatroomsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatroomsView)
        view.addSubview(searchContainer)

        //Chatrooom
        chatroomsView.topAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        chatroomsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        chatroomsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chatroomsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //SearchContainer
        searchContainer.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.1803921569, blue: 0.2470588235, alpha: 1)
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        
        searchContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        //SearchBar
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .white
        searchBar.placeholder = "Search"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchContainer.addSubview(searchBar)
        searchContainer.addSubview(profileImageView)

    
        searchBar.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor, constant: -4).isActive = true
        
        //ProfileImage
        profileImageView.image = #imageLiteral(resourceName: "huy_profile")
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor, constant: -8).isActive = true
    }
}
