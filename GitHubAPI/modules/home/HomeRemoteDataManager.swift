//
//  HomeService.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 20/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

class HomeRemoteDataManager: HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func retrieveRepoList(_ username: String) {
        
        Api<[RepositoryModel]>().request(with: .home, method: .get) { result in
            switch result {
                case .success(let repos):
                    self.remoteRequestHandler?.onReposRetrieved(repos)
                case .error(let error):
                    self.remoteRequestHandler?.didFailedRequest(with: error)
            }
        }
    }
    
}
