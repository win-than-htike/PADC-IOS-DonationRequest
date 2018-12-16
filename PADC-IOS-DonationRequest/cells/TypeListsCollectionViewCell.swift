//
//  TypeListsCollectionViewCell.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class TypeListsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var typeListCollectionView: UICollectionView!
    
    var typeList: [DonationTypesVO] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.typeListCollectionView.dataSource = self
        self.typeListCollectionView.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "DonationTypeCollectionViewCell", collectionView: typeListCollectionView)
    }

}

extension TypeListsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.window?.frame.width ?? 200, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked \(typeList[indexPath.item].typeId!)")
    }
}

extension TypeListsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.typeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationTypeCollectionViewCell", for: indexPath) as! DonationTypeCollectionViewCell
        let type = self.typeList[indexPath.item]
        cell.bindData(type)
        return cell
        
    }
    
    
}
