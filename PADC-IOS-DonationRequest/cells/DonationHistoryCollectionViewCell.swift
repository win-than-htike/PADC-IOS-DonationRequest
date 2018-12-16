//
//  DonationHistoryCollectionViewCell.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class DonationHistoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionViewDonationHistory: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionViewDonationHistory.dataSource = self
        self.collectionViewDonationHistory.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "DonationHistoryCell", collectionView: collectionViewDonationHistory)
    }

}

extension DonationHistoryCollectionViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let donatedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationHistoryCell", for: indexPath) as! DonationHistoryCell
        return donatedCell
    }
    
    
}

extension DonationHistoryCollectionViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.window?.frame.width ?? 200, height: 100)
    }
}
