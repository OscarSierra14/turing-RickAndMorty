//
//  BaseUseCaseProtocol.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation

protocol BaseUseCaseProtocol {
    var repository: RemoteRepositoryProtocol { get }
}
