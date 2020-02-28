//
//  RepositoryModel.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Foundation

struct RepositoryModel: Codable {

    var name: String?
    var language: String?
    var owner: OwnerModel?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case language
        case owner
    }
    
    init(name: String,
         language: String?,
         owner: OwnerModel?) {
        self.name = name
        self.language = language
        self.owner = owner
    }
}

extension RepositoryModel {
    
    static func generateMock() -> RepositoryModel {
        let repo = RepositoryModel(name: "githubapi",
                                   language: "Swift",
                                   owner: OwnerModel.generateMock())
        return repo
    }
    
    static func generateMockWithoutUserName() -> RepositoryModel {
        let repo = RepositoryModel(name: "githubapi",
                                   language: "Objective C",
                                   owner: OwnerModel.generateMockWithoutUserName())
        return repo
    }
    
    static func generateMockWithoutAvatar() -> RepositoryModel {
        let repo = RepositoryModel(name: "githubapi",
                                   language: "C#",
                                   owner: OwnerModel.generateMockWithoutAvatar())
        return repo
    }
    
    static func generateArrayMock() -> [RepositoryModel] {
        
        let repo = generateMock()
        let repoWithoutUserName = generateMockWithoutUserName()
        let repoWithoutAvatar = generateMockWithoutAvatar()
        
        var repos = [RepositoryModel]()
        repos.append(repo)
        repos.append(repoWithoutUserName)
        repos.append(repoWithoutAvatar)
        repos.append(repo)
        repos.append(repoWithoutUserName)
        repos.append(repoWithoutAvatar)
        return repos
    }
}
