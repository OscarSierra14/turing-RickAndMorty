//
//  BaseResponse.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
}

struct Response: Codable {
    let statusCode: Int
    let message: String?
}
