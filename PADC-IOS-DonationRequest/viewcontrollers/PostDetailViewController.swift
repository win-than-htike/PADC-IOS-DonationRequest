//
//  PostDetailViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var lblDescpt: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPostCreatorName: UILabel!
    @IBOutlet weak var ivPostCreatorImage: UIImageView!
    
    var post: PostVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivPostCreatorImage.layer.cornerRadius = 16
        bindData(post!)
    }
    
    func bindData(_ post : PostVO)  {
        
        lblDescpt.text = post.desc!
        lblLocation.text = post.location!
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
