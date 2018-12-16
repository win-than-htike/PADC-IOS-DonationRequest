//
//  DataModel.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataModel {
    
    private init() {}
    
    static var shared: DataModel = {
        return sharedDataModel
    }()
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    var user : UserVO? = nil
    
    func addPost(donationPost: DonationPostVO, success: @escaping () -> Void, failure: @escaping () -> Void) {
        NetworkManager.shared.addPost(donationPost: donationPost, success: {
            success()
        }) {
            failure()
        }
    }
    
    func uploadImage(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.imageUpload(data: data, success: { (url) in
            success(url)
        }) {
            failure()
        }
        
    }
    
    func register(user : UserVO) {
        
        let ref = Database.database().reference()
        ref.child("users").child(user.id).setValue(UserVO.parseToDictionary(user: user))
        
    }
    
    func login(email : String, password : String, success : @escaping () -> Void, failure : @escaping () -> Void) {
        
        NetworkManager.shared.login(email: email, password: password, success: { (user) in
            
            self.user = user
            success()
            
        }) {
            failure()
        }
        
    }
}
