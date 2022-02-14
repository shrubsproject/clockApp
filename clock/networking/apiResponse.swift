//
//  apiResponse.swift
//  clock
//
//  Created by Ilya Egorov on 12.02.2022.
//

import Foundation

enum APIResult<Body> {
    case success(APIResponse<Body>)
    case failure(APIError)
}

struct APIResponse<Body> {
    let statusCode: Int
    let body: Body
}

extension APIResponse where Body == Data? {
    func decode<T: Decodable>(to type: T.Type) throws -> APIResponse<T> {
        guard let data = body else {
            throw APIError.dataFailed
        }
     
        guard let decodedJSON = try? JSONDecoder().decode(T.self, from: data) else {
            throw APIError.decodingFailed
        }
        
        return APIResponse<T>(statusCode: self.statusCode, body: decodedJSON)
    }
}
