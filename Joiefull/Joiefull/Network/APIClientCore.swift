//
//  APIClientCore.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//


import Foundation

final class APIClientCore {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func performAPIRequest <T: Decodable> (endPoint: Endpoint) async -> Result<T, APIError> {
        
        let url = endPoint.api
        var request : URLRequest?
        request = URLRequest(url: url)
        request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request?.httpMethod = endPoint.httpMethod.rawValue
        
        do {
            guard let request else {
                return .failure(.genericError())
            }
            let (data, response) = try await session.data(for: request)
           
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.genericError())
            }
            return performResponse(endPoint: endPoint, data: data, httpResponse: httpResponse)
        } catch let apiError as APIError {
            return .failure(apiError)
        } catch {
            return .failure(.genericError())
        }
    }
    
    
    func performResponse <T: Decodable> (endPoint: Endpoint, data: Data, httpResponse: HTTPURLResponse)  -> Result<T, APIError> {
        
        switch httpResponse.statusCode {
        case 200...299:
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                return .failure(APIError.invalidData())
            }
            return .success(result)
            
        default:
            return .failure(APIError.genericError(message: "Unknown error"))
        }
        
    }
    
}
