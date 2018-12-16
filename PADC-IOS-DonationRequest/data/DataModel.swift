//
//  File.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataModel {
    private init(){}
    
    static var shared : DataModel = {
        return sharedDataModel
    }()
    
    private static var sharedDataModel : DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    func getPosts(success: @escaping ([PostVO]) -> Void, failure: @escaping () -> Void ) {
        NetworkManager.shared.loadPosts(success: { (data) in
            success(data)
        }, failure: {failure()})
    }
    
    func getTypes(success: @escaping ([DonationTypesVO]) -> Void, failure: @escaping () -> Void){
        NetworkManager.shared.loadDonationTypes(success: { (data) in
            success(data)
        }, failure: {failure()})
    }
    
    func getPostByRegionName(regionName: String, success: @escaping ([PostVO]) -> Void, failure: @escaping () -> Void) {
        
        var filteredList : [PostVO] = []
        NetworkManager.shared.loadPosts(success: { (dataList) in
            
            for data in dataList {
                if data.location == regionName {
                    filteredList.append(data)
                    success(filteredList)
                }else {
                    failure()
                }
            }
            
        }, failure: {
            failure()
        })
    }

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
