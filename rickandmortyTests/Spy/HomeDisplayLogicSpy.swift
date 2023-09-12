//
//  HomeDisplayLogicSpy.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty

class HomeDisplayLogicSpy: HomeDisplayLogic {
    var reloadCharactersCalled = false
    func reloadCharacters() {
        reloadCharactersCalled = true
    }
}
