//
//  EndPoints.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation

struct DataConstants {
    static let  baseURL = "https://rickandmortyapi.com/api/"

    struct Endpoints {
        static let characters = "\(baseURL)character/"
        static let search = "\(baseURL)character/?name=%@"
    }
}
