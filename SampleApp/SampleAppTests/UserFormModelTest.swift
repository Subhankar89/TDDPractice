//
//  UserFormModelTest.swift
//  SampleAppTests
//
//  Created by Subhankar  Acharya on 14/09/21.
//

import XCTest
@testable import SampleApp

class UserFormModelTest: XCTestCase {
    
    func test_userFormModel_canCreateInsatnce() {
        let instanceSetup = UserFormModel(
            firstName: "Subhankar",
            lastName: "Acharya",
            email: "subhankaracharya@gmail.com"
        )
        XCTAssertNotNil(instanceSetup)
    }
}
