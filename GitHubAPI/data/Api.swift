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
    
    func request(with params: String, urlString: ApiDefinitions.Base, endPoint: ApiDefinitions.Endpoint, method: ApiDefinitions.Method, completion: @escaping ApiCompletion) {
        
        let urlComplete = urlString.rawValue+params+endPoint.rawValue
        if let url = URL(string: urlComplete) {
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
                    do {
                        let objectResponse = try JSONDecoder().decode(ResponseError.self, from: dataReceived)
                        DispatchQueue.main.async {
                            if let msg = objectResponse.message, msg.lowercased() == "not found" {
                                completion(.error(CustomError(msg: "User not found. Please enter another name")))
                            } else {
                                completion(.error(CustomError(msg: objectResponse.message ?? "Something went wrong on fetching data")))
                            }
                        }
                        return
                    } catch let error {
                        DispatchQueue.main.async {
                            completion(.error(CustomError(msg: error.localizedDescription)))
                        }
                        return
                    }
                }
            }
            remoteTask.resume()
        } else {
            completion(.error(CustomError(msg: self.errorMessage)))
        }
    }
}
