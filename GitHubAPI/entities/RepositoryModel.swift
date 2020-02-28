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
}
