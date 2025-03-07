//
//  MockApiClient.swift
//  Joiefull
//
//  Created by Bruno Evrard on 07/03/2025.
//
import Foundation

final class MockApiClient: APIService {
    
    var session: MockUrlSession
    var apiClientCore: APIClientCore {
        APIClientCore(session: session)
    }
    
    init(session: MockUrlSession) {
        self.session = session
    }
    
    func clothesList() async -> Result<[Clothe], APIError> {
        return await apiClientCore.performAPIRequest(endPoint: Endpoint.clothes)
    }
}
