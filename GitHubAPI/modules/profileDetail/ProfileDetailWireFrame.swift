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
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileDetail")
//        if let view = viewController as? ProfileDetailViewController {
//            let presenter: ProfileDetailPresenterProtocol = ProfileDetailPresenter()
//            let wireFrame: ProfileDetailWireFrameProtocol = ProfileDetailWireFrame()
//
//            view.presenter = presenter
//            presenter.view = view
//            presenter.repos = repos
//            presenter.wireFrame = wireFrame
//
//            return viewController
//        }
        return UIViewController()
    }
}


