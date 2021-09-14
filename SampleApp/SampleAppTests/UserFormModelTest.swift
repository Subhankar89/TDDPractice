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
        let instanceSetup = makeSUT()
        XCTAssertNotNil(instanceSetup)
    }
    
    func test_userFormModel_shouldPassIfValidName() {
        let sut = makeSUT()
        XCTAssertTrue(sut.isValidName())
    }

    private func makeSUT() -> UserFormModel {
        let userModel = UserFormModel(id: 1, name: "Subhankar", email: "xyz@gmail.com")
        return userModel
    }
}
