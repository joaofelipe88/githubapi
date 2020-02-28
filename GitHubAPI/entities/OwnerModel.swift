//
//  OwnerModel.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Foundation

struct OwnerModel: Codable {
    
    var login: String?
    var avatarUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
    
    init(login: String, avatarUrl: String?) {
        self.login = login
        self.avatarUrl = avatarUrl
    }
}

extension OwnerModel {
    
    static func generateMock() -> OwnerModel {
        let owner = OwnerModel(login: "joaofelipe88",
                              avatarUrl: "https://avatars3.githubusercontent.com/u/61201821?v=4")
        return owner
    }
    
    static func generateMockWithoutUserName() -> OwnerModel {
        let owner = OwnerModel(login: "",
                              avatarUrl: "https://avatars3.githubusercontent.com/u/61201821?v=4")
        return owner
    }
    
    static func generateMockWithoutAvatar() -> OwnerModel {
        let owner = OwnerModel(login: "joaofelipe88",
                              avatarUrl: "")
        return owner
    }
}

