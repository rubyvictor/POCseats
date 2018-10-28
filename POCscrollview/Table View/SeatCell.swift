//
//  SeatCell.swift
//  POCscrollview
//
//  Created by Victor Lee on 28/10/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class SeatCell: UITableViewCell {
    
    let seatView: UIImageView = {
       let sv = UIImageView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.contentMode = .scaleAspectFill
        sv.backgroundColor = .red
        return sv
    }()
    
    
    var seats: Seats? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        guard let seatImageName = seats?.seatView else { return }
        seatView.image = seatImageName
    }
}
