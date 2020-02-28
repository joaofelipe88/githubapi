//
//  HomeWireFrame.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "RepoNavigationController")
        if let view = navController.children.first as? HomeViewController {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    func presentRepoListScreen(from view: HomeViewControllerProtocol, forRepos repos: [RepositoryModel]) {
        
        let repoListViewController = ProfileDetailWireFrame.createProfileDetailModule(forRepos: repos)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(repoListViewController, animated: true)
        }
    }

}
