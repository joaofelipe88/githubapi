//
//  ProfileDetailWireFrame.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

class ProfileDetailWireFrame: ProfileDetailWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createProfileDetailModule(forRepos repos: [RepositoryModel]) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileDetailView")
        if let view = viewController as? ProfileDetailViewController {
            view.showRepoList(with: repos)
            return view
        }
        return UIViewController()
    }
}


