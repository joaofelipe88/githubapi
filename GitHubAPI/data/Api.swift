//
//  Api.swift
//  GitHubAPI
//
//  Created by João Felipe Carvalho on 19/02/20.
//  Copyright © 2020 João Felipe Carvalho. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(CustomError)
}

class Api<T: Decodable> {
    
    // MARK: - Variables

    private let errorMessage = "A network error has occurred. Check your Internet connection and try again later."
    private var remoteTask: URLSessionTask!
    
    // MARK: - Typealias
    
    typealias ApiCompletion = (Result<T>) -> Void
    
    // MARK: - Mehods
    
    func request(with urlString: ApiDefinitions.Base, method: ApiDefinitions.Method, completion: @escaping ApiCompletion) {
        
        if let url = URL(string: "https://api.github.com/users/joaofelipe88/repos") {
            var urlRequest = URLRequest(url: url)
            urlRequest = urlRequest.defaultJsonRequest()
            urlRequest.setHttpMethod(method)
            remoteTask = URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
                guard let dataReceived = data else {
                    DispatchQueue.main.async {
                        completion(.error(CustomError(msg: self.errorMessage)))
                    }
                    return
                }
                do {
                    
                    let objectResponse = try JSONDecoder().decode(T.self, from: dataReceived)
                    DispatchQueue.main.async {
                        completion(.success(objectResponse))
                    }
                    return
                } catch {
                    DispatchQueue.main.async {
                        completion(.error(CustomError(msg: self.errorMessage)))
                    }
                    return
                }
            }
            remoteTask.resume()
        } else {
            completion(.error(CustomError(msg: self.errorMessage)))
        }
    }
}
