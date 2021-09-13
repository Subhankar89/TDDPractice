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
        let bundle = Bundle(for: UsersTableVC.self)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: bundle)
        
        let initialVC = storyBoard.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        _ = try XCTUnwrap(navigation.topViewController as? UsersTableVC)
    }
    
    func test_viewDidLoad_setTitle() throws {
        let bundle = Bundle(for: UsersTableVC.self)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: bundle)
        
        let initialVC = storyBoard.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        let sut = try XCTUnwrap(navigation.topViewController as? UsersTableVC)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "Users")
    }
}

