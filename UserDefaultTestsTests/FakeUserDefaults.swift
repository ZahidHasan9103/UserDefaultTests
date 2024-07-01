//
//  FakeUserDefaults.swift
//  UserDefaultTestsTests
//
//  Created by ZEUS on 1/7/24.
//

import Foundation
@testable import UserDefaultTests

class FakeUserDefaults: UserDefaultsProtocol{
    
    var integers: [String: Any] = [:]
    
    func setValue(_ value: Any?, forKey key: String) {
        integers[key] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        if let val = integers[defaultName] as? Int{
            return val
        }else{
            return 0
        }
    }
    
    
}
