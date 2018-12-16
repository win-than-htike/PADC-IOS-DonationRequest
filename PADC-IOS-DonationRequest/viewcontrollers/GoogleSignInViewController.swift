//
//  GoogleSignInViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class GoogleSignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate  {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error) != nil {
            print("An error occured during Google Authentication")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                self.showAlertDialog(inputMessage: error.localizedDescription)
                return
            }
            
            
            let navigationViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostListViewController") as! UINavigationController
            let vc = navigationViewController.viewControllers[0] as! UITabBarController
//            vc.lblAccountName.text = Auth.auth().currentUser?.displayName ?? "Ye Pyae Sone Tun"
//            vc.lblAccountEmail.text = Auth.auth().currentUser?.email ?? "test@gmail.com"
//            vc.ivAccountImage = Auth.auth().currentUser?.photoURL
            self.present(navigationViewController, animated: true, completion: nil)
            
        }
    }
    
    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        dismiss(animated: true) {() -> Void in }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        if Auth.auth().currentUser != nil {
            let navigationViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostListViewController") as! UINavigationController
            let vc = navigationViewController.viewControllers[0] as! UITabBarController
            self.present(navigationViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnGoogleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    

}


