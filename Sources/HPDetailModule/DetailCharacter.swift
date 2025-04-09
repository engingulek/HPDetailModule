//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation

struct DetailCharacter: Decodable {
    let fullName, nickname: String
    let hogwartsHouse: HogwartsHouse
    let interpretedBy: String
    let children: [String]
    let image: String
    let birthdate: String
    let index: Int
}

enum HogwartsHouse: String, Decodable {
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}
