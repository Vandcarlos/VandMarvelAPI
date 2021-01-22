// Created on 21/01/21. Copyright © 2021 Vand. All rights reserved.

import XCTest
import VandMarvelAPI

class VMAuthTests: XCTestCase {

    func testPublicKeyHasBeenSet() {
        let publicKey = "test"

        let vmAuth = VMAuth(privateKey: "Jhon", publicKey: publicKey)

        let authQuery = vmAuth.authQuery

        XCTAssertEqual(authQuery.first(where: { $0.name == "apikey"} )?.value, publicKey)
    }

}
