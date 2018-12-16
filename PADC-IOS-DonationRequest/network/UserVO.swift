//
//  UserVO.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

class UserVO: NSObject {
    
    var id : String = UUID.init().uuidString
    
    var username : String? = nil
    
    var email : String? = nil
    
    var phone : String? = nil
    
    var password : String? = nil
    
    var confirmPassword : String? = nil
    
    var image : String? = nil
    
    public static func parseToDictionary(user : UserVO) -> [String : Any] {
        
        let value = [
            "id" : user.id,
            "username" : user.username ?? "",
            "email" : user.email ?? "",
            "phone" : user.phone ?? "",
            "password" : user.password ?? "",
            "confirmPassword" : user.confirmPassword ?? ""
        ]
        
        return value
        
    }
    
    public static func parseToUserVO(json : [String : Any]) -> UserVO {
        
        let user = UserVO()
        user.id = json["id"] as! String
        user.username = json["username"] as? String
        user.phone = json["phone"] as? String
        user.email = json["email"] as? String
        user.password = json["password"] as? String
        return user
        
    }
    
}
