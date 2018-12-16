//
//  NetworkManager.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NetworkManager {
    let rootRef: DatabaseReference!
    
    private init (){
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func loadPosts(success: @escaping ([PostVO]) -> Void,failure: @escaping () -> Void ) {
        rootRef.child("donations").observe(.value) { (dataSnapshot) in
            if let posts = dataSnapshot.children.allObjects as? [DataSnapshot] {
                var postList : [PostVO] = []
                
                for post in posts {
                    if let value = post.value as? [String: AnyObject]{
                        postList.append(PostVO.parseToPostVO(json: value))
                    }
                }
                
                success(postList)
            }
        }
    }
    
    func loadDonationTypes(success: @escaping (([DonationTypesVO]) -> Void), failure: @escaping () -> Void) {
        rootRef.child("donationTypes").observe(.value) { (dataSnapshot) in
            if let types = dataSnapshot.children.allObjects as? [DataSnapshot] {
                var typeList : [DonationTypesVO] = []
                
                for type in types {
                    if let value = type.value as? [String: AnyObject] {
                        typeList.append(DonationTypesVO.parseToDonationTypesVO(json: value))
                    }
                }
                success(typeList)
            }
        }
    }
}
