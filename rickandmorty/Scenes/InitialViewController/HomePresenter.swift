//
//  HomePresenter.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

protocol HomePresentationLogic {
    func reloadCharacters()
}

class HomePresenter: HomePresentationLogic {

    weak var viewController: HomeDisplayLogic?

    // MARK: - HomePresentationLogic
    func reloadCharacters() {
        viewController?.reloadCharacters()
    }
}
