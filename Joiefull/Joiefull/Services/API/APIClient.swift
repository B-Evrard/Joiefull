//
//  APIClient.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation

final class APIClient: APIService {

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    var apiClientCore: APIClientCore {
        APIClientCore(session: session)
    }

    func clothesList() async -> Result<[Clothe], APIError> {
        return await apiClientCore.performAPIRequest(endPoint: Endpoint.clothes)
    }

}
