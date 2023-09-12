//
//  ServiceProtocol.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation
import Alamofire

enum ServiceResponse<T: Codable>: Codable {
    case success(response: T)
    case failure(error: ErrorResponse?)
    case notConnectedToInternet
}

struct ErrorResponse: Codable {
    let message: String?
    let statusCode: Int?
}

protocol ServiceProtocol {
    
    func request<T: Codable>(_ url: URLConvertible,
                             of type: T.Type,
                             method: HTTPMethod,
                             parameters: [String: Any]?,
                             headers: [String: String]?,
                             completionHandler: @escaping (ServiceResponse<T>) -> Void)
    
    func responseMapping<T: Codable>(from dataRequest: DataRequest,
                                     completionHandler: @escaping (ServiceResponse<T>) -> Void)
    
    func cancelAllRequest()
}
