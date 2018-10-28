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
    let numSeatsPerColumnEconomy = 200
    let numSeatsPerColumnBiz = 20
    
    fileprivate func setupSeatsCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        collectionView.backgroundColor = .white
        collectionView.register(CustomSeatCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(CustomSeatCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
        }
        
        setupSeatsCollectionView()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) and \(indexPath.item)")
        guard let seatCells = collectionView.visibleCells as? [CustomSeatCell] else { return }
        seatCells.forEach { $0.redView.backgroundColor = .red }
        guard let seatCell = collectionView.cellForItem(at: indexPath) as? CustomSeatCell else { return }
        seatCell.redView.backgroundColor = .blue
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .white

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 100, left: spacing, bottom: 100, right: 0)
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return different seat types as sections
        return numSeatsPerColumnEconomy + numSeatsPerColumnBiz
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section < numSeatsPerColumnEconomy {
            return 7
        } else if section <= numSeatsPerColumnBiz + numSeatsPerColumnEconomy {
            return 6
        }
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numSeatsInColumn: CGFloat = 9
        let deviceHeight = collectionView.frame.height - 200
        let cellHeight = (deviceHeight - (numSeatsInColumn - 1) * spacing) / numSeatsInColumn
        
        if (indexPath.section < numSeatsPerColumnEconomy) {
            if (indexPath.item == 2) || (indexPath.item == 5) {
                return .init(width: 50, height: 2 * cellHeight + spacing)
            }
        } else if (indexPath.section <= numSeatsPerColumnBiz + numSeatsPerColumnEconomy) {
            if (indexPath.item == 0) || (indexPath.item == 3) || (indexPath.item == 6) || (indexPath.item == 8) {
                return .init(width: 50, height: 2 * cellHeight + spacing)
            }
        }
        return .init(width: 50, height: cellHeight)
    }
    
    // Section headers become vertical if scrolling is horizontal.  need to fix
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        header.backgroundColor = .purple
        return header
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
