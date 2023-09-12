//
//  HomeWorkerSpy.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty

class HomeWorkerSpy: HomeWorkerProtocol {
    var fetchCharactersCalled = false
    func fetchCharacters(completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        fetchCharactersCalled = true
    }
    
    var fetchNextPageCharactersCalled = false
    func fetchNextPageCharacters(page: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        fetchNextPageCharactersCalled = true
    }
    
    var searchCharacterCalled = false
    func searchCharacter(name: String, completionHandler: @escaping (ServiceResponse<Home.CharacterListResponse?>) -> Void) {
        searchCharacterCalled = true
    }
    
}
