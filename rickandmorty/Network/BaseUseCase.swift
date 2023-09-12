//
//  BaseUseCase.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation

class BaseUseCase: BaseUseCaseProtocol {
    
    let repository: RemoteRepositoryProtocol
    
    public init(repository: RemoteRepositoryProtocol = RemoteRepository()) {
        self.repository = repository
    }
}
