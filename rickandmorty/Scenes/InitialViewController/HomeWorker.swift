//
//  HomeWorker.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit
import Alamofire

protocol HomeWorkerProtocol {
    func fetchCharacters(completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void)
    func fetchNextPageCharacters(page: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void)
    func searchCharacter(name: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void)
}


class HomeWorker: BaseUseCase, HomeWorkerProtocol {
    func fetchCharacters(completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        repository.request(
            endpoint: DataConstants.Endpoints.characters,
            method: .get,
            requestBody: nil,
            completionHandler: completionHandler
        )
    }

    func fetchNextPageCharacters(page: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        repository.request(
            endpoint: page,
            method: .get,
            requestBody: nil,
            completionHandler: completionHandler
        )
    }

    func searchCharacter(name: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        let url = String(format: DataConstants.Endpoints.search, name)

        repository.request(
            endpoint: url,
            method: .get,
            requestBody: nil,
            completionHandler: completionHandler
        )
    }
}
