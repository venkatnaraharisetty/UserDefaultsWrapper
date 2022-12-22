//
//  ContentViewModel.swift
//  UserDefaultsWrapper
//
//  Created by Venkata  naraharisetty on 12/22/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published private (set) var userEnteredName: String = ""

    @UserDefaultStorage(defaultValue: "", key: "userName")
    var storedUserName: String?
    
    func updateName(name: String) {
        storedUserName = name
        userEnteredName = storedUserName ?? ""
    }
}
