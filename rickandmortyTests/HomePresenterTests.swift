//
//  HomePresenterTests.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty
import XCTest

class HomePresenterTests: XCTestCase {

    // MARK: - Subject under test

    var sut: HomePresenter?
    var viewController: HomeDisplayLogicSpy!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomePresenter()
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }

    // MARK: - Test setup

    func setupHomePresenter() {
        sut = .init()
        viewController = .init()
        sut?.viewController =  viewController
    }

    // MARK: - Tests
    func test_reloadData() {
        sut?.reloadCharacters()

        XCTAssertTrue(viewController.reloadCharactersCalled)
    }
}
