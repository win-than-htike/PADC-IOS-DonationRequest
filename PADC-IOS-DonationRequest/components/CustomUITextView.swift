//
//  CustomUITextView.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import UIKit

class CustomUITextView: UITextView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
}
