//
//  CustomError.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

struct CustomError: Error {
    let msg: String
    
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString(msg, comment: "")
    }
}
