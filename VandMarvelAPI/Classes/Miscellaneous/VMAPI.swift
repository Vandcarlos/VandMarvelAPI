// Created on 21/01/21. 

import Foundation
import SwiftHash

public class VMAPI {

    public class func request<T: Decodable>(
        _ request: VMRequest,
        dto: T.Type,
        completion: @escaping (Result<T, VMError>) -> Void
    ) {

        guard let urlRequest = request.urlRequest else { return completion(.failure(.requestMalformed) ) }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            completion(self.parseRequest(data: data, response: response, error: error))
        }.resume()
    }

    class func parseRequest<T: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) -> (Result<T, VMError>) {
        if let error = error {
            return .failure(VMError(error: error))
        }

        guard let data = data else { return .failure(.noBody)  }

        do {
            let body = try JSONDecoder().decode(T.self, from: data)
            return .success(body)
        } catch let error {
            debugPrint(error)
            return .failure(.failOnParse)
        }
    }

}

fileprivate extension VMRequest {

    private var queryItems: [URLQueryItem] {
        query.map { URLQueryItem(name: $0.key, value: $0.value) }
    }

    var urlRequest: URLRequest? {
        let urlString = VandMarvelAPI.shared.baseURL + path

        guard var urlComponents = URLComponents(string: urlString) else { return nil }

        urlComponents.queryItems = VandMarvelAPI.shared.auth.authQuery + queryItems

        guard let url = urlComponents.url else { return nil }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue

        if case .post(let body) = httpMethod {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }

        header.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }

        return urlRequest
    }

}
