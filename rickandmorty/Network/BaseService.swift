//
//  BaseService.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation
import Alamofire

class BaseService: ServiceProtocol {
    
    let sessionManager: Session
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.af.default) {
        sessionManager = Session(configuration: configuration)
    }
    
    func request<T: Codable>(_ url: URLConvertible,
                             of type: T.Type,
                             method: HTTPMethod = .get,
                             parameters: [String: Any]? = [:],
                             headers: [String: String]? = [:],
                             completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        
        // Verifica si los encabezados son válidos
        var requestHeaders: HTTPHeaders? = nil
        if let headers = headers {
            requestHeaders = HTTPHeaders(headers)
        }

        let request = sessionManager.request(url,
                                             method: method,
                                             parameters: parameters,
                                             encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                                             headers: requestHeaders)
        responseMapping(from: request, completionHandler: completionHandler)
    }
    
    func responseMapping<T: Codable>(from dataRequest: DataRequest,
                                     completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        dataRequest.responseDecodable(of: T.self) { [weak self] (serviceResponse) in
            guard let self = self else { return }

            if let response = serviceResponse.value {
                completionHandler(.success(response: response))
            } else if let error = serviceResponse.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                completionHandler(.notConnectedToInternet)
            } else if let afError = serviceResponse.error, afError.isSessionTaskError {
                completionHandler(.notConnectedToInternet)
            } else if let data = serviceResponse.data, let errorResponse = self.handlerErrorResponse(data: data) {
                completionHandler(.failure(error: errorResponse))
            } else {
                completionHandler(.failure(error: nil))
            }
        }
    }
    
    private func handlerErrorResponse(data: Data) -> ErrorResponse? {
        showError(data: data)
        let decoder = JSONDecoder()
        guard let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) else { return nil }
        return errorResponse
    }
    
    private func showError(data: Data?) {
        guard let data = data, let json = String(data: data, encoding: .utf8) else { return }
        print("Failure Response: \(json)")
    }
    
    func cancelAllRequest() {
        sessionManager.cancelAllRequests()
    }
}
