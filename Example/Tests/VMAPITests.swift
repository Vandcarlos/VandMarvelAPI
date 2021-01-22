// Created on 21/01/21. Copyright © 2021 Vand. All rights reserved.

import XCTest
import Foundation
@testable import VandMarvelAPI

class VMAPITests: XCTestCase {

    func testParseBody() throws {

        struct AnyBody: Decodable {

            var name: String

        }

        let bodyToTest = "{ \"name\": \"jhon\" }"

        let data = Data(bodyToTest.utf8)

        let result: Result<AnyBody, VMError> = VMAPI.parseRequest(data: data, response: nil, error: nil)

        var bodyResult: AnyBody? = nil

        switch result {
        case .success(let body): bodyResult = body
        case .failure: break
        }

        XCTAssertNotNil(bodyResult)
        XCTAssertEqual(bodyResult?.name, "jhon")
    }

    func testFailOnParseBody() throws {
        struct AnyBody: Decodable {

            var name: String

        }

        let bodyToTest = "{ \"names\": \"jhon\" }"

        let data = Data(bodyToTest.utf8)

        let result: Result<AnyBody, VMError> = VMAPI.parseRequest(data: data, response: nil, error: nil)

        var failOnParseBody = false

        switch result {
        case .success: break
        case .failure(let error): failOnParseBody = error == .failOnParse
        }

        XCTAssertTrue(failOnParseBody)
    }

    func testFailWithNoBody() throws {
        struct AnyBody: Decodable {

            var name: String

        }

        let result: Result<AnyBody, VMError> = VMAPI.parseRequest(data: nil, response: nil, error: nil)

        var failOnParseBody = false

        switch result {
        case .success: break
        case .failure(let error): failOnParseBody = error == .noBody
        }

        XCTAssertTrue(failOnParseBody)
    }

}
