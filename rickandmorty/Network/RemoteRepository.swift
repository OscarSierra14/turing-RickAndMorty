//
//  RemoteRepository.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation
import Alamofire
import UIKit

protocol RemoteRepositoryProtocol {
    var service: ServiceProtocol { get }
    
    func request<T: Codable>(endpoint: String, method: HTTPMethod, requestBody: Codable?, completionHandler: @escaping (ServiceResponse<T>) -> Void)
    
    func cancellAllRequest()
}

class RemoteRepository: RemoteRepositoryProtocol {
        
    let service: ServiceProtocol
    
    public init(service: ServiceProtocol = BaseService()) {
        self.service = service
    }
    
    func request<T: Codable>(endpoint: String, method: HTTPMethod, requestBody: Codable? = nil, completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        
        var parameters: [String: Any]?
        
        if let request = requestBody {
            parameters = request.dictionary
        }
        
        service.request(endpoint,
                        of: T.self,
                        method: method,
                        parameters: parameters,
                        headers: nil) { response in
            switch response {
            case .success(let response):
                completionHandler(.success(response: response))
            case .failure(let error):
                completionHandler(.failure(error: error))
            case .notConnectedToInternet:
                completionHandler(.notConnectedToInternet)
            }
        }
    }

    func cancellAllRequest() {
        service.cancelAllRequest()
    }
}
