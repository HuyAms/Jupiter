//
//  ChatroomMenuCell.swift
//  Jupiter
//
//  Created by HuyTrinh on 09/10/2018.
//  Copyright © 2018 HuyTrinh. All rights reserved.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor =  #colorLiteral(red: 0.2745098039, green: 0.6039215686, blue: 0.5215686275, alpha: 1)
        v.layer.cornerRadius = 5
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bgView)
        
        selectionStyle = .none
        
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        
        sendSubviewToBack(bgView)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = !selected

        backgroundColor = .clear
//        contentView.backgroundColor = selected ? .orange : .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
