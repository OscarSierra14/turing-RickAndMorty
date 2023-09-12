//
//  HomeInteractor.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

protocol HomeBusinessLogic {
    var charactersList: Home.CharacterListResponse? { get set}
    func viewDidLoad()
    func fetchNextPage()
    func searchCharacter(text: String)
}

protocol HomeDataStore {
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {

    // MARK: - Attributes
    var charactersList: Home.CharacterListResponse?
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerProtocol?

    // MARK: - HomeDataStore

    init(worker: HomeWorkerProtocol = HomeWorker()) {
        self.worker = worker
    }

    // MARK: - HomeBusinessLogic
    func viewDidLoad() {
        fetchCharacters()
    }

    private func fetchCharacters() {
        worker?.fetchCharacters(completionHandler: { [weak self] response in
            switch response {
            case .success(response: let response):
                self?.charactersList = response
                self?.presenter?.reloadCharacters()
            default:
                break
            }
        })
    }
    
    func fetchNextPage() {
        guard let nextPage = charactersList?.info?.next
        else {
            return
        }
        
        worker?.fetchNextPageCharacters(page: nextPage, completionHandler: { [weak self] response in
            switch response {
            case .success(response: let response):
                self?.charactersList?.info = response?.info
                self?.charactersList?.results?.append(contentsOf: response?.results ?? [])
                self?.presenter?.reloadCharacters()
            default:
                break
            }
        })
    }

    func searchCharacter(text: String) {
        if text.isEmpty {
            fetchCharacters()
            return
        }

        worker?.searchCharacter(name: text, completionHandler: { [weak self] response in
            switch response {
            case .success(response: let response):
                self?.charactersList = response
                self?.presenter?.reloadCharacters()
            default:
                break
            }
        })
    }
}
