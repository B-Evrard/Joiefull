//
//  MockUrlSession.swift
//  Joiefull
//
//  Created by Bruno Evrard on 07/03/2025.
//

import Foundation
class MockUrlSession: URLSessionProtocol {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        guard let data = data, let urlResponse = urlResponse else {
            throw APIError.invalidData()
        }
        return (data, urlResponse)
    }
}
