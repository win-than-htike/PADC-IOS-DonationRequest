//
//  ProfileHeaderCollectionViewCell.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivProfileImage: UIImageView!
    @IBOutlet weak var lblAccountDisplayName: UILabel!
    @IBOutlet weak var lblAccountEmail: UILabel!
    @IBOutlet weak var lblFavShortQuote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProfileImage.layer.cornerRadius = 50
        ivProfileImage.image = UIImage.init(imageLiteralResourceName: "the_new_evil")
    }

}
