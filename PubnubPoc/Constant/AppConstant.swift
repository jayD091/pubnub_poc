//
//  AppConstant.swift
//  PubnubPoc
//
//  Created by Theonetech on 28/08/22.
//

import Foundation

class AppConstant {
    
    static let shared = AppConstant()
    
    static let pubNubSecretKey = "sec-c-MTUyZmRiM2EtYzE1ZC00OGE0LWFlZWUtZDY5OGM4OWVhYjE2"
    static let pubNubSubscribeKey = "sub-c-f70daada-e38f-4310-a388-797e57b95b1e"
    static let pubNubPublishKey = "pub-c-7f6b4f35-6414-4d21-9919-8ea7b81a7aec"

    var getUUID: String {
        get {
            return NSUUID().uuidString
        }
    }
    
}


