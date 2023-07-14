//
//  APIHelper.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class APIHelper {
    static let shared = APIHelper()
    private init(){}
    
    func callAPI<T: Decodable>(for: T.Type = T.self, urlString: URL, method: RequestMethod, headers: HTTPHeaders? = nil, body: JSON? = nil, completion: @escaping (Result <T>) -> Void) {

        var urlRequest = URLRequest(url: urlString)
                urlRequest.httpMethod = method.rawValue

                if let headers = headers {
                    urlRequest.allHTTPHeaderFields = headers
                    urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                }

                if let body = body {
                    urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
                }

                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: urlRequest) { data, response, error in
                    if let err = error {
                        completion(.failure(err.localizedDescription as! Error))
                    }
                    do {
                        let decoder = JSONDecoder()
                        try completion(.success(decoder.decode(T.self, from: data!)))
                    } catch let decodingError {
                        completion(.failure(decodingError))
                    }
                }
                task.resume()
        
    }
    
//    func callAPI<T: Codable>(urlString: URL, method: String, resultType: T.Type, completion: @escaping(Result <resultType, Error>) -> Void ) {
//        var urlRequest = URLRequest(url: urlString)
//        urlRequest.httpMethod = method
//        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let err = error {
//                completion(.failure(err.localizedDescription as! Error))
//                return
//            }
//            do {
//                let res = try? JSONDecoder().decode(resultType.self, from: data!)
//                completion(.success(res!))
//            } catch let jsonError {
//                completion(.failure(jsonError.localizedDescription as! Error))
//            }
//        }.resume()
//    }
}
