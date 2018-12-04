//
//  airplaneSeatingController.swift
//  POCscrollview
//
//  Created by Victor Lee on 28/10/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class AirplaneSeatingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
    let cellId = "cellId"
    let headerId = "headerId"
    
    let spacing: CGFloat = 8
    let numSeatsPerColumnEconomy = 20
    let numColumns = 9
    
    fileprivate func setupSeatsCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    fileprivate func seatsContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        collectionView.backgroundColor = .white
        collectionView.register(CustomSeatCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(CustomSeatCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
        }
        
        setupSeatsCollectionView()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) and \(indexPath.item)")
        guard let seatCells = collectionView.visibleCells as? [CustomSeatCell] else { return }
        seatCells.forEach { $0.redView.backgroundColor = .green }
        guard let seatCell = collectionView.cellForItem(at: indexPath) as? CustomSeatCell else { return }
        seatCell.redView.backgroundColor = .blue
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .white

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 5, bottom: 20, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return different seat types as sections
//        return numSeatsPerColumnEconomy + numSeatsPerColumnBiz
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section < numSeatsPerColumnEconomy {
//            return 9
//        } else if section <= numSeatsPerColumnBiz + numSeatsPerColumnEconomy {
//            return 6
//        }
//        return 9
        if section <= numSeatsPerColumnEconomy {
            return 1100
        }
        return 9
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numSeatsInColumn: CGFloat = CGFloat(numSeatsPerColumnEconomy)
        let numSeatsInRow: CGFloat = CGFloat(numColumns)
        let deviceHeight = collectionView.frame.height
        let deviceWidth = collectionView.frame.width
        let cellWidth = deviceWidth / numSeatsInRow
//        let cellHeight = deviceHeight / numSeatsInColumn
        
        return .init(width: cellWidth, height: cellWidth)

        
//
//        if (indexPath.section <= numSeatsPerColumnEconomy) {
//            if (indexPath.item == 2) {
//                return .init(width: 80, height: cellHeight)
//            }
//        }
//
//        else if (indexPath.section <= numSeatsPerColumnBiz + numSeatsPerColumnEconomy) {
//            if (indexPath.item == 0) || (indexPath.item == 3) || (indexPath.item == 6) || (indexPath.item == 8) {
//                return .init(width: 50, height: 2 * cellHeight + spacing)
//            }
//        }
//        return .init(width: cellWidth, height: cellWidth)
    }
    
    // Section headers become vertical if scrolling is horizontal.  need to fix
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
//        header.backgroundColor = .purple
//        return header
//    }
// 
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
    
}
