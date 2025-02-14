//
//  APIService.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//


import Foundation

protocol APIService {
    
    func clothesList() async -> Result<[Clothe],APIError>
    
}
