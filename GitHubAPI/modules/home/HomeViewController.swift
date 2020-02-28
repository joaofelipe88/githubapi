//
//  ViewController.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    var presenter: HomePresenterProtocol!
    var repoList: [RepositoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.presenter.getRepoList(username: usernameTextField.text)
    }

}

extension HomeViewController: HomeViewControllerProtocol {
    
    func showRepoList(with repos: [RepositoryModel]) {
        repoList = repos
    }
    
    func showError(with message: String) {
        showErrorAlert(message)
    }
    
    func showLoading() {
//        HUD.show(.progress)
    }
    
    func hideLoading() {
//        HUD.hide()
    }
    
}

