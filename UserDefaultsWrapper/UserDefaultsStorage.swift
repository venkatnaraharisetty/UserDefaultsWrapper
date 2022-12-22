//
//  UserDefaultStorage.swift
//  UserDefaultsWrapper
//
//  Created by Venkata  naraharisetty on 12/19/22.
//

import Foundation

@propertyWrapper
public struct UserDefaultStorage<Value> where  Value: Codable {
    let defaultValue: Value
    let key: String
    
    var existingValue: Value?
    
    struct Wrapper<Value>: Codable where Value: Codable {
        let wrapped: Value
    }
    
    public init(defaultValue: Value, key: String) {
        precondition(!key.isEmpty, "Key should not be empty")
        self.defaultValue = defaultValue
        self.key = key
    }
    
    public var wrappedValue: Value {
        mutating get {
            if let existingValue = existingValue {
                return existingValue
            }
            if let rawData = UserDefaults.standard.object(forKey: key) as? Data {
                let wrappedValue = try? JSONDecoder().decode(Wrapper<Value>.self, from: rawData)
                self.existingValue = wrappedValue?.wrapped
                return existingValue ?? self.defaultValue
            }
            return self.defaultValue
        }
        set {
            if let rawData = try? JSONEncoder().encode(Wrapper(wrapped: newValue)) {
                let wrappedValue = try? JSONDecoder().decode(Wrapper<Value>.self, from: rawData)
                self.existingValue = wrappedValue?.wrapped
                UserDefaults.standard.set(rawData, forKey: key)
            } else {
                self.existingValue = wrappedValue
            }
        }
    }
}
