//
//  URLRequest.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

extension URLRequest {
    
    mutating func setHttpMethod(_ method: ApiDefinitions.Method) {
        switch method {
        case .get:
            self.httpMethod = "GET"
        case .post:
            self.httpMethod = "POST"
        }
    }
    
    mutating func defaultJsonRequest() -> URLRequest {
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
        return self
    }
}
