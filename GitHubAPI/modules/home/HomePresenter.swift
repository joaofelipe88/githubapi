//
//  HomePresenter.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
    }
    
    func getRepoList(username: String?) {
        if let string = username {
            interactor?.retrieveRepoList(username: string)
        }
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func didRetrieveRepos(_ repos: [RepositoryModel]) {
        view?.hideLoading()
        wireFrame?.presentRepoListScreen(from: view!, forRepos: repos)
    }
    
    func didFailedRequest(with error: CustomError) {
        view?.hideLoading()
        view?.showError(with: error.msg)
    }
    
}
