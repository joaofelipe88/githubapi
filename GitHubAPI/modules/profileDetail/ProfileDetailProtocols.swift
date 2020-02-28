//
//  ProfileDetailProtocols.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

protocol ProfileDetailWireFrameProtocol: class {
    static func createProfileDetailModule(forRepos repos: [RepositoryModel]) -> UIViewController
}
