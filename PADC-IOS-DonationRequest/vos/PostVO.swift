//
//  PostVO.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import UIKit

class PostVO : NSObject{
    var postId: String? = nil
    var donationDate: Int64? = nil
    var location: String? = nil
    var postCreator: String? = nil
    var postDescpt: String? = nil
    
    var id: String? = nil
    var date: String? = nil
    var createdDate: Int64? = nil
    var updatedDate: Int64? = nil
    var desc: String? = nil
    
    
    public static func parseToPostVO(json: [String: AnyObject]) -> PostVO {
        
        let  post = PostVO()
//        post.postId = json["id"] as! String
//        post.donationDate = json["date"] as! Int64
//        post.location = json["location"] as! String
//        post.postCreator = json["postCreator"] as! String
//        post.postDescpt = json["updatedDate"] as! String
        
        post.id = json["id"] as! String
        post.date = json["date"] as! String
        post.createdDate = json["createdDate"] as! Int64
        post.location = json["location"] as! String
        post.updatedDate = json["updatedDate"] as! Int64
        post.desc = json["desc"] as! String
        
        return post
    }
    
    public static func parseToDictionary(post : PostVO) -> [String : Any] {
        
//        let value = [
//            "id" : post.postId,
//            "donationDate" : post.donationDate,
//            "location" : post.location,
//            "postCreator" : post.postCreator,
//            "postDescpt" : post.postDescpt
//            ] as [String : Any]
//
        
        let value = [
            "id" : post.id,
            "date" : post.date,
            "createdDate" : post.createdDate,
            "location" : post.location,
            "updatedDate" : post.updatedDate,
            "desc" : post.desc
        ] as [String: Any]
        return value
        
    }
    
}
