//
//  HomePresentationLogicSpy.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty

class HomePresentationLogicSpy: HomePresentationLogic {
    var reloadCharactersCalled = false

    func reloadCharacters() {
        reloadCharactersCalled = true
    }
}
