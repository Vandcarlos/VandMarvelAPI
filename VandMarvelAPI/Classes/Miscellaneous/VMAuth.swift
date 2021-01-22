// Created on 21/01/21.

import SwiftHash

open class VMAuth {

    public init(privateKey: String, publicKey: String) {
        self.privateKey = privateKey
        self.publicKey = publicKey
    }

    private let privateKey: String
    private let publicKey: String

    open var authQuery: [URLQueryItem] {
        let timestamp = Date().timeIntervalSince1970.description
        let hash = MD5(timestamp + privateKey + publicKey).lowercased()

        return [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: publicKey)
        ]
    }

}
