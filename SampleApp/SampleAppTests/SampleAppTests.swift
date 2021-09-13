//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 10/09/21.
//

import XCTest
@testable import SampleApp

class UsersTableVCTest: XCTestCase {
    
    func can_Initialise_tableView() throws {
        //let bundle = Bundle(for: UsersTableVC.self)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        //let initialVC = storyBoard.instantiateViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        //_ = try XCTUnwrap(navigation.topViewController as? UsersTableVC)
    }
}

