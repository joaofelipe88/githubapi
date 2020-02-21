//
//  HomeProtocols.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: class {
    
    var presenter: HomePresenterProtocol! { get set }
    
    // PRESENTER -> VIEW
    func showError(with message: String)
    
    func showLoading()
    
    func hideLoading()
}

protocol HomeWireFrameProtocol: class {
    static func createHomeModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentRepoListScreen(from view: HomeViewControllerProtocol, forRepos repos: [RepositoryModel])
}

protocol HomePresenterProtocol: class {
    var view: HomeViewControllerProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func getRepoList(_ username: String?)
}

protocol HomeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveRepos(_ repos: [RepositoryModel])
    func didFailedRequest(with error: CustomError)
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveRepoList(username: String)
}

protocol HomeRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveRepoList(_ username: String)
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onReposRetrieved(_ repos: [RepositoryModel])
    func didFailedRequest(with error: CustomError)
}
