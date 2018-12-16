//
//  DonationTypeCollectionViewCell.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class DonationTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivDonationTypeIcon: UIImageView!
    
    @IBOutlet weak var lblDonationTypeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindData(_ data: DonationTypesVO)  {
        lblDonationTypeName.text = data.typeName
        ivDonationTypeIcon.sd_setImage(with: URL(string:data.typeIconImageUrl ?? "post_selected_tab"), placeholderImage:UIImage(named:"post_selected_tab"))
    }

}
