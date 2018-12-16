//
//  NetworkManager.swift
//  PADC-IOS-DonationRequest
//

//  Created by Ye Pyae Sone Tun on 12/15/18.

//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

import Firebase
import FirebaseDatabase
import FirebaseStorage

class NetworkManager {
    
    let rootRef: DatabaseReference!
    
    let storageRef = Storage.storage().reference().child("profile_images")
    
    private init() {

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

    func addPost(donationPost : DonationPostVO, success : @escaping () -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("donations").child(donationPost.id).setValue(DonationPostVO.parseToDictionary(donationPost: donationPost))
        success()
        
    }
    
    func imageUpload(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        if let imageData = data {
            
            let uploadImageRef = storageRef.child("\(Date().millisecondsSince1970).png")
            
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in

                print(metadata ?? "NO METADATA")
                print(error ?? "NO ERROR")

                uploadImageRef.downloadURL(completion: { (url, error) in

                    if let error = error {
                        print(error)
                    }

                    if let url = url {
                        print(url.absoluteString)
                        success(url.absoluteString)
                    } else {
                        failure()
                    }

                })

            }
        

            uploadTask.observe(.success) { snapshot in
                print("upload complete")
                success("")
            }
            
            uploadTask.observe(.failure) { snapshot in
                guard let errorCode = (snapshot.error as? NSError)?.code else {
                    return
                }
                guard let error = StorageErrorCode(rawValue: errorCode) else {
                    return
                }
                switch (error) {
                case .objectNotFound:
                    // File doesn't exist
                    print("object not found")
                    break
                case .unauthorized:
                    // User doesn't have permission to access file
                    print("unathorized")
                    break
                case .cancelled:
                    // User cancelled the download
                    print("cancelled")
                    break
                    
                    /* ... */
                    
                case .unknown:
                    // Unknown error occurred, inspect the server response
                    print("unkonwn")
                    break
                default:
                    // Another error occurred. This is a good place to retry the download.
                    print("default")
                    break
                }
            
            uploadTask.resume()
            
            }
            
        }
        
    }
    
    func login(email : String, password : String, success : @escaping (UserVO) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("users").observe(.value) { (dataSnapshot) in
            
            if let users = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                for user in users {
                    
                    if let value = user.value as? [String : AnyObject] {
                        
                        let userVO = UserVO.parseToUserVO(json: value)
                        
                        print("\(userVO.email ?? "") and \(userVO.password ?? "Default")")
                        print("\(email) and \(password)")
                        
                        if email == userVO.email ?? "" && password == userVO.password ?? "" {
                            success(userVO)
                            return
                        } else {
                            
                        }
                        
                    } else {
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    

}
