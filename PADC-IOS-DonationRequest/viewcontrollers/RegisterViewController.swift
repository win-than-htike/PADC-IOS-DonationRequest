//
//  RegisterViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class RegisterViewController: BaseViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var ivProfileImage: UIImageView!
    @IBOutlet weak var tfUsername: ShadowTextField!
    @IBOutlet weak var tfEmail: ShadowTextField!
    @IBOutlet weak var tfPhone: ShadowTextField!
    @IBOutlet weak var tfPassword: ShadowTextField!
    @IBOutlet weak var tfConfirmPassword: ShadowTextField!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
    }
    
    @IBAction func btnUploadImage(_ sender: UIButton) {
        self.chooseUpload(sender, imagePickerControllerDelegate: self)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        
        if tfPassword.text!.isEmpty {
            self.showAlertDialog(inputMessage: "Password is Empty!")
            return
        }
      
        if tfPassword.text! == tfConfirmPassword.text! {
            
            let user = UserVO()
            user.username = tfUsername.text!
            user.phone = tfPhone.text!
            user.email = tfEmail.text!
            user.password = tfPassword.text!
            user.confirmPassword = tfConfirmPassword.text!
            
            DataModel.shared.register(user: user)
            
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    @IBAction func ivBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)
//        self.showLoading()
        if let pickedImage = info[.editedImage] as? UIImage {
            
            DataModel.shared.uploadImage(data: pickedImage.pngData(), success: { (url) in
                self.hideLoading()
                self.ivProfileImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
                
            }) {
                self.hideLoading()
                self.showAlertDialog(inputMessage: "Error.")
            }
            
        }
        
    }
}


