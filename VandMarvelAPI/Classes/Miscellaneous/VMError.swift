// Created on 21/01/21. 

import Foundation

public enum VMError: Error {

    case generic
    case requestMalformed
    case noBody
    case failOnParse
    case noInternet

    init(error: Error) {
        if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
            self = .noInternet
        } else {
            self = .generic
        }
    }

}
