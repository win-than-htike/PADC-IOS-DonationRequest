//
//  DonationPostVO.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

class DonationPostVO: NSObject {
    
    var id : String = UUID.init().uuidString
    
    var desc : String? = nil
    
    var location : String? = nil
    
    var donationDate : String? = nil
    
    var user: UserVO? = nil
    
    var createdDate : String? = String(Date().millisecondsSince1970)
    
    var updatedDate : String? = String(Date().millisecondsSince1970)
    
    public static func parseToDonationPostVO (json : [String : AnyObject]) -> DonationPostVO {
        
        let donationPost = DonationPostVO()
        donationPost.id = json["id"] as! String
        donationPost.desc = json["desc"] as? String
        donationPost.location = json["location"] as? String
        donationPost.donationDate = json["date"] as? String
        donationPost.createdDate = json["createdDate"] as? String
        donationPost.updatedDate = json["updatedDate"] as? String
        if let user = json["user"] as? [String : Any] {
            donationPost.user = UserVO.parseToUserVO(json: user)
        }
        return donationPost
        
    }
    
    public static func parseToDictionary(donationPost : DonationPostVO) -> [String : Any] {
        
        let value = [
            "id" : donationPost.id,
            "desc" : donationPost.desc ?? "",
            "location" : donationPost.location ?? "",
            "date" : donationPost.donationDate ?? "",
            "createdDate" : Date().millisecondsSince1970,
            "updatedDate" : Date().millisecondsSince1970,
            "user" : UserVO.parseToDictionary(user: donationPost.user ?? UserVO())
            ] as [String : Any]
        
        return value
        
    }
    
}
