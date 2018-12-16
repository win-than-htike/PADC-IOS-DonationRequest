//
//  LoginViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var tfEmail: ShadowTextField!
    @IBOutlet weak var tfPassword: ShadowTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        
//        let alert = UIAlertController(title: "Register",
//                                      message: "",
//                                      preferredStyle: .alert)
//
//        let saveAction = UIAlertAction(title: "save", style: .default)
//        {
//            action in
//            let email = alert.textFields![0]
//            let password = alert.textFields![1]
//
//            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {
//                (authResult, error) in
//                if let error = error {
//                    self.showAlertDialog(inputMessage: error.localizedDescription)
//                }
//
//                guard let user = authResult?.user else {return}
//
//                user.sendEmailVerification(completion: { (error) in
//                    if let error = error {
//                        self.showAlertDialog(inputMessage: error.localizedDescription)
//                    }
//                })
//            })
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
//
//        alert.addTextField { textEmail in textEmail.placeholder = "Email" }
//        alert.addTextField { textPassword in textPassword.placeholder = "Password"
//            textPassword.isSecureTextEntry = true
//        }
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//
//        present(alert, animated: true, completion: nil)
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! UINavigationController
        
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.showLoading()
        DataModel.shared.login(email: tfEmail.text!, password: tfPassword.text!, success: {
            
            self.hideLoading()
            let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            
        }, failure: {
            self.hideLoading()
            self.showAlertDialog(inputMessage: "Login Failed!")
        })
        
//        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!)
//        {
//            (authResult, error) in
//            if let error = error {
//                self.showAlertDialog(inputMessage: error.localizedDescription)
//            }
//
//            guard let user = authResult?.user else { return }
//
//            if !user.isEmailVerified {
//                self.showAlertDialog(inputMessage: "Please verify your email!")
//            } else {
//                let newPostViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewPostViewController") as! NewPostViewController
//                self.present(newPostViewController, animated: true, completion: nil)
//            }
//        }
        
        
        
    }
    
}

