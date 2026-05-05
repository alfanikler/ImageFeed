//
//  Constants.swift
//  ImageFeed
//
//  Created by Alfa on 06.05.2026.
//

import Foundation

enum Constants {
    private static let env = ProcessInfo.processInfo.environment
    
    static let accessKey: String = getValue(fromEnv: "ACCESS_KEY")
    static let secretKey: String = getValue(fromEnv: "SECRET_KEY")

    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURLString = "https://api.unsplash.com"
    
    private static func getValue(fromEnv key: String) -> String {
        guard let value = env[key] else {
            fatalError("Отсутствует переменная окружения \(key)")
        }
        
        return value
    }
}

