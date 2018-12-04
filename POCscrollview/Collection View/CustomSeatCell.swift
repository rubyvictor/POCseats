//
//  CustomSeatCell.swift
//  POCscrollview
//
//  Created by Victor Lee on 28/10/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class CustomSeatCell: UICollectionViewCell {
    
    let redView: UIView = {
       let rv = UIView()
        rv.backgroundColor = .yellow
        rv.translatesAutoresizingMaskIntoConstraints = false
        return rv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(redView)
        redView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    override var isSelected: Bool {
        didSet {
            redView.backgroundColor = isSelected ? .blue : .yellow
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
