//
//  SeatModel.swift
//  POCscrollview
//
//  Created by Victor Lee on 28/10/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

struct Seats {
    
    var seatView: UIImage?
    
 
    
    static func fetchSeatViews() -> [Seats] {

        var seatViewArray = [Seats]()
        for _ in 0...300 {
            let seats = Seats(seatView: UIImage(named: "D"))
            seatViewArray.append(seats)
        }
        return seatViewArray
    }
    
}
