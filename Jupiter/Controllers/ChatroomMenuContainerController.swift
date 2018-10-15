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
    
    let searchContainer = SearchContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
        
        let chatroomsView = chatroomMenuController.view!
        chatroomsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatroomsView)
        view.addSubview(searchContainer)
        
        searchContainer.searchBar.delegate = chatroomMenuController

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
    }
}

class SearchContainerView: UIView {
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.placeholder = "Search"
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    let profileImageView: ProfileImageView = {
        let iv = ProfileImageView(image: UIImage(named: "huy_profile"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(searchBar)
        addSubview(profileImageView)

        //SearchBar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        searchBar.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true


        //ProfileImage

        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
