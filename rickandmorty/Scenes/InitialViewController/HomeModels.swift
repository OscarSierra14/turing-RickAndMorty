//
//  HomeModels.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

enum Home {

    // MARK: - Use cases
    struct CharacterListResponse: Codable {
        var info: InfoResponse?
        var results: [ResultResponse]?
    }

    struct InfoResponse: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }

    struct ResultResponse: Codable {
        let id: Int?
        let name: String?
        let status: String?
        let species: String?
        let type: String?
        let gender: String?
        let image: String?
        let episode: [String]?
        let url: String?
        let created: String?
        let origin: OriginResponse?
        let location: LocationResponse?
    }

    struct OriginResponse: Codable {
        let name: String
        let url: String
    }

    struct LocationResponse: Codable {
        let name: String
        let url: String
    }
}
