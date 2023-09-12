//
//  HomeWorkerTests.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty
import XCTest

class HomeWorkerTests: XCTestCase {

    // MARK: - Subject under test

    var sut: HomeWorker?

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomeWorker()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test setup

    func setupHomeWorker() {
        sut = HomeWorker()
    }

    // MARK: - Tests
    func test_fechCharacter() {
        sut?.fetchCharacters(completionHandler: { response in
            XCTAssertNotNil(response)
        })
    }

    func test_fetchNextPageCharacters() {
        sut?.fetchNextPageCharacters(page: "https://rickandmortyapi.com/api/location?page=2", completionHandler: { response in
            XCTAssertNotNil(response)
        })
    }

    func test_searchCharacter() {
        sut?.searchCharacter(name: "1", completionHandler: { response in
            XCTAssertNotNil(response)
        })
    }
}
