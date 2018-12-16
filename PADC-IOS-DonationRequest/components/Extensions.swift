//
//  Extensions.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewController {
    
    func callbackProgressImageUpload(progress: Float) {
        self.showProgressLoading(progress: progress)
    }
    
    func callbackFailureImageUpload(error : String) {
        self.hideLoading()
        self.showAlertDialog(inputMessage: error)
    }
    
}

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

extension UIViewController {
    
    public func showAlertDialog(inputTitle: String = "Message", inputMessage: String, alertActionTitle: String = "OK!") {
        let alert = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
    
}
