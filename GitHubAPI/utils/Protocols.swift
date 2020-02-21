//
//  Protocols.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import UIKit

//MARK: - HomePresenter
protocol Presenter: class {
    associatedtype T
    
    var viewController: T { get set }
    
    func attachView(_ viewController: T)
}

extension Presenter {
    func attachView(_ viewController: T) {
        self.viewController = viewController
    }
}
