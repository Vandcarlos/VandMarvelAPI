// Created on 21/01/21. 

public enum VMHttpMethod {

    case get
    case post(body: [String: Any?])

    var rawValue: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }

}
