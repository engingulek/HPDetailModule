//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation
import HPNetworkKit

//MARK: DetailServiceProtocol
protocol DetailServiceProtocol {
    func getCharacterDetail(index:Int) async throws -> DetailCharacter?
}

//MARK: DetailService
class DetailService : DetailServiceProtocol {
    private let networkManager:NetworkManagerProtocol = NetworkManager()
    func getCharacterDetail(index: Int) async throws -> DetailCharacter? {
        do{
            let response = try await networkManager.fetch(
                target: .characterDetail(index),
                responseClass: DetailCharacter?.self)
            return response
        }catch{
            throw error
        }
    }
}
