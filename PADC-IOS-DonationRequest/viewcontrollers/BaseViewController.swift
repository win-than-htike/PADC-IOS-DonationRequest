//
//  BaseViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import JGProgressHUD

var imagePicker = UIImagePickerController()

class BaseViewController: UIViewController {
    
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func chooseUpload(_ sender: UIButton, imagePickerControllerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera(imagePickerControllerDelegate: imagePickerControllerDelegate)
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary(imagePickerControllerDelegate: imagePickerControllerDelegate)
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera(imagePickerControllerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate)
    {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.delegate = imagePickerControllerDelegate
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func openGallary(imagePickerControllerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate)
    {
        imagePicker.delegate = imagePickerControllerDelegate
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.modalPresentationStyle = .overFullScreen
        self.present(imagePicker, animated: true)
    }
    
    func showLoading(message : String = "Loading...") {
        hud.textLabel.text = message
        hud.show(in: self.view)
    }
    
    func showProgressLoading(progress : Float) {
        let progressInt = Int(progress*100)
        hud.vibrancyEnabled = true
        if !hud.isVisible {
            hud.indicatorView = JGProgressHUDPieIndicatorView()
        }
        hud.progress = Float(progressInt)/100.0
        hud.detailTextLabel.text = "\(progressInt)% Complete"
        hud.textLabel.text = "Uploading..."
        if !hud.isVisible {
            hud.show(in: self.view)
        }
        
        if progressInt == 100 {
            
            UIView.animate(withDuration: 0.1, animations: {
                self.hud.textLabel.text = "Success"
                self.hud.detailTextLabel.text = nil
                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            })
            
            hud.dismiss(afterDelay: 1.0)
        }
        
    }
    
    func hideLoading() {
        hud.dismiss()
    }

}
