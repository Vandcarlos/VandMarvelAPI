// Created on 21/01/21. 

public protocol VMRequest {

    var path: String { get }
    var header: [String: String] { get }
    var query: [String : String?] { get }
    var httpMethod: VMHttpMethod { get }

}
