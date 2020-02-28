//
//  ProfileDetailTests.swift
//  GitHubAPITests
//
//  Created by João Felipe Carvalho on 21/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Quick
import Nimble

@testable import GitHubAPI

class ProfileDetailTests: QuickSpec {

    override func spec() {
        describe("ProfileDetail View") {
            
            let username = "joaofelipe88"
            let avartarUrl = "https://avatars3.githubusercontent.com/u/61201821?v=4"
            
            context("ProfileDetail") {
                
                it("With Username and Avatar") {
                    let profileDetailWithUsername = self.initiateWithUsernameAndImage()
                    expect(profileDetailWithUsername.login).to(equal(username))
                    expect(profileDetailWithUsername.imageString).to(equal(avartarUrl))
                }
                
                it("Without Username") {
                    let profileDetailWithoutUsername = self.initiateWithoutUsername()
                    expect(profileDetailWithoutUsername.login).toNot(equal(username))
                    expect(profileDetailWithoutUsername.imageString).to(equal(avartarUrl))
                }

                it("Without Avatar") {
                    let profileDetailWithoutAvatar = self.initiateWithoutImage()
                    expect(profileDetailWithoutAvatar.login).to(equal(username))
                    expect(profileDetailWithoutAvatar.imageString).toNot(equal(avartarUrl))
                }
            }
        }
    }
    
    func initiateWithUsernameAndImage() -> ProfileDetailViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileDetailView")
        if let view = viewController as? ProfileDetailViewController {
            view.showRepoList(with: [RepositoryModel.generateMock()])
            return view
        }
        return ProfileDetailViewController()
    }
    
    func initiateWithoutUsername() -> ProfileDetailViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileDetailView")
        if let view = viewController as? ProfileDetailViewController {
            view.showRepoList(with: [RepositoryModel.generateMockWithoutUserName()])
            return view
        }
        return ProfileDetailViewController()
    }
    
    func initiateWithoutImage() -> ProfileDetailViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileDetailView")
        if let view = viewController as? ProfileDetailViewController {
            view.showRepoList(with: [RepositoryModel.generateMockWithoutAvatar()])
            return view
        }
        return ProfileDetailViewController()
    }
    
}
