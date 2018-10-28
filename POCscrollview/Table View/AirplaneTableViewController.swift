//
//  ViewController.swift
//  POCscrollview
//
//  Created by Victor Lee on 26/10/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class AirplaneTableViewController: UITableViewController {

    let cellId = "cellId"
    var seats: [Seats] = Seats.fetchSeatViews()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(SeatCell.self, forCellReuseIdentifier: cellId)
        
        view.backgroundColor = UIColor.yellow
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button1 = UIButton(type: .system)
        button1.setTitle("From", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.addTarget(self, action: #selector(handleFromButton), for: .touchUpInside)
        button1.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button1.backgroundColor = UIColor.blue
        button1.layer.cornerRadius = 3
        
        let button2 = UIButton(type: .system)
        button2.setTitle("To", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.addTarget(self, action: #selector(handleToButton), for: .touchUpInside)
        button2.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button2.backgroundColor = UIColor.red
        button2.layer.cornerRadius = 3
        
        let headerView = UIStackView(arrangedSubviews: [button1, button2])
        headerView.distribution = .fillEqually
        headerView.axis = .horizontal
        headerView.spacing = 10
        
        return headerView
        
    }
    
    @objc private func handleToButton(){
        print("tapped header button to")
        print("tapped header button from")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Destination in Header".uppercased(), style: .default, handler: { (_) in
            print("Performed Destination button tap in header")
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func handleFromButton(){
        print("tapped header button from")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "From in Header".uppercased(), style: .default, handler: { (_) in
            print("Performed From button tap in header")
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SeatCell
        let seating = seats[indexPath.row]
        cell.imageView?.image = seating.seatView
        return cell
//        cell.textLabel?.text = "CAN ADD MORE VIEWS INSIDE HERE?"
    }
}
