//
//  HomeRouter.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

import UIKit

@objc protocol HomeRoutingLogic {
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?

    // MARK: - Passing data
}
