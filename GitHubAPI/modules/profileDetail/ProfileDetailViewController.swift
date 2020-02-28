//
//  ProfileDetailViewController.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 21/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit
import PKHUD
import Kingfisher

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var repoList: [RepositoryModel] = []
    var imageString: String = ""
    var login: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        if !imageString.isEmpty, let imageUrl = URL(string: imageString) {
            userImageView.layer.masksToBounds = false
            userImageView.layer.cornerRadius = userImageView.frame.height/2
            userImageView.clipsToBounds = true
            userImageView.kf.setImage(with: imageUrl)
            userImageView.kf.indicatorType = .activity
        }
        
        if !self.login.isEmpty {
            usernameLabel.text = self.login
        } else {
            usernameLabel.text = "unknown"
        }
    }
}

extension ProfileDetailViewController: ProfileDetailViewControllerProtocol {
    
    func showRepoList(with repos: [RepositoryModel]) {
        
        repoList = repos
        
        if let string = repos.first?.owner?.avatarUrl {
            self.imageString = string
        }
        
        if let login = repos.first?.owner?.login {
            self.login = login
        } else {
            self.login = "unknown"
        }
    }
    
    func showError(with message: String) {
        showErrorAlert(message)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension ProfileDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! ReposTableViewCell
        
        let repo = repoList[indexPath.row]
        cell.set(forRepo: repo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
