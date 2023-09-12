//
//  HomeBusinessLogicSpy.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty

class HomeBusinessLogicSpy: HomeBusinessLogic {
    var charactersList: Home.CharacterListResponse?
    
    var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    var fetchNextPageCalled = false
    func fetchNextPage() {
        fetchNextPageCalled = true
    }
    
    var searchCharacterCalled = false
    func searchCharacter(text: String) {
        searchCharacterCalled = true
    }
}
