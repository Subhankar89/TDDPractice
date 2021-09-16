//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 10/09/21.
//

import XCTest
@testable import SampleApp

class UsersTableVCTest: XCTestCase {
    
    func test_canInitialise_tableView() throws {
        
        _ = try makeSUT()
    }
    
    func test_viewDidLoad_setTitle() throws {
        
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.title, "Users")
    }
    
    func test_viewDidLoad_configureTableView() throws {
        
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        
        //removing implementation detail
        XCTAssertNotNil(sut.userTableView.delegate)
        XCTAssertNotNil(sut.userTableView.dataSource)
    }
    
    func test_viewDidLoad_initialState() throws {
        
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        
        //checks initial state of tableview before load
        XCTAssertEqual(sut.userTableView.numberOfRows(inSection: 0), 0)
    }
    
    private func makeSUT() throws -> UsersTableVC {
        
        let bundle = Bundle(for: UsersTableVC.self)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: bundle)
        
        let initialVC = storyBoard.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        return try XCTUnwrap(navigation.topViewController as? UsersTableVC)
    }
}

