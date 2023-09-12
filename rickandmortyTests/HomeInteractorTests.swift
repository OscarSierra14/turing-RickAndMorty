//
//  HomeInteractorTests.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 11/09/23.
//

@testable import rickandmorty
import XCTest

class HomeInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: HomeInteractor?
    var presenter: HomePresentationLogicSpy?
    var worker: HomeWorkerSpy?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        worker = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupHomeInteractor() {
        presenter = .init()
        sut = .init()
        sut?.presenter = presenter
        worker = .init()
        sut?.worker = worker
    }
    
    // MARK: - Tests
    func test_viewDidLoad() {
        sut?.viewDidLoad()

        XCTAssertTrue(worker?.fetchCharactersCalled ?? false)
    }

    func test_fetchNextPageCharacters() {
        sut?.charactersList = Home.CharacterListResponse(
            info: .init(count: nil, pages: nil, next: "www.google.com", prev: nil),
            results: []
        )

        sut?.fetchNextPage()

        XCTAssertTrue(worker?.fetchNextPageCharactersCalled ?? false)
    }
}
