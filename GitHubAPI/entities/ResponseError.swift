//
//  ResponseError.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 21/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Foundation

struct ResponseError: Codable {
    
    var message: String?
    var documentationUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case message
        case documentationUrl = "documentation_url"
    }
}
