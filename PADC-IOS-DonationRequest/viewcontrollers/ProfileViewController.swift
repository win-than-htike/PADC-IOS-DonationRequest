//
//  ProfileViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileCollectionView.dataSource = self
        self.profileCollectionView.delegate = self
        
        cellRegister()
    }
    
    func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "ProfileHeaderCollectionViewCell", collectionView: profileCollectionView)
        CellRegisterUtil.cellRegister(nibName: "DonationHistoryCollectionViewCell", collectionView: profileCollectionView)
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width, height: 240)
        }else{
            return CGSize(width: self.view.frame.width, height: self.view.frame.height)
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeaderCollectionViewCell", for: indexPath) as! ProfileHeaderCollectionViewCell
            return headerCell
        }else {
            let donatedHistoryListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationHistoryCollectionViewCell", for: indexPath) as! DonationHistoryCollectionViewCell
            return donatedHistoryListCell
        }
    }
    
    
}
