//
//  UserStore.swift
//  AppContainerExample
//
//  Created by Patrick Mick on 5/4/19.
//  Copyright © 2019 Patrick Mick. All rights reserved.
//

import Foundation

struct User {
    let email: String
}

final class UserStore {
    var currentUser: User? {
        return nil
        return User(email: "cool_dood@gmail.com")
    }
}
