//
//  HomeInteractor.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func retrieveRepoList(username: String) {
        remoteDatamanager?.retrieveRepoList(username)
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func onReposRetrieved(_ repos: [RepositoryModel]) {
        presenter?.didRetrieveRepos(repos)
    }
    
    func didFailedRequest(with error: CustomError) {
        presenter?.didFailedRequest(with: error)
    }
    
}

