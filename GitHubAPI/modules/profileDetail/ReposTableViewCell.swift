//
//  ReposTableViewCell.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 21/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    func set(forRepo repo: RepositoryModel) {
        self.selectionStyle = .none
        
        if let name = repo.name {
            nameLabel?.text = name
        } else {
            nameLabel?.text = "not defined yet"
        }
        
        if let language = repo.language {
            languageLabel?.text = language
        } else {
            languageLabel?.text = "not defined yet"
        }
    }

}
