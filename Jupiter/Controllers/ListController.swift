//
//  ListController.swift
//  Jupiter
//
//  Created by HuyTrinh on 08/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class ListController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
    
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(label)
        label.frame = view.frame
    }
}
