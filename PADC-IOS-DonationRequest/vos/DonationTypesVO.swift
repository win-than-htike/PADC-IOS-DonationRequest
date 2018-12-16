//
//  File.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
class DonationTypesVO: NSObject {
    var typeIconImageUrl: String? = nil
    var typeName: String? = nil
    var typeId: String? = nil
    
    public static func parseToDonationTypesVO(json: [String: AnyObject]) -> DonationTypesVO {
        let type = DonationTypesVO()
        type.typeId = json["typeId"] as? String
        type.typeName = json["typeName"] as? String
        type.typeIconImageUrl = json["typeIconImageUrl"] as? String
        
        return type
    }
    
    public static func parseToDictionary(type : DonationTypesVO) -> [String : Any] {
        
        let value = [
            "typeId" : type.typeId,
            "typeName" : type.typeName,
            "typeIconImageUrl": type.typeIconImageUrl] as [String: Any]
        return value
    }
}
