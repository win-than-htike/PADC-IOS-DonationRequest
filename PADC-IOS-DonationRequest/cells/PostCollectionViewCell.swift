//
//  PostCollectionViewCell.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblPostCreaterName: UILabel!
    @IBOutlet weak var lblPostedDate: UILabel!
    @IBOutlet weak var lblPostContent: UILabel!
    @IBOutlet weak var ivPostCreatorImage: UIImageView!
    
    var p: PostVO!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(_ post: PostVO){
        p = post
        ivPostCreatorImage.layer.cornerRadius = 12
        lblPostContent.text = post.desc
//        lblPostedDate.text = post.donationDate as? String
        lblPostCreaterName.text = post.id

    }
    
    @IBAction func btnConnectToDonate(_ sender: Any) {
        print("clicked \(p.id!)")
    }
    
}
