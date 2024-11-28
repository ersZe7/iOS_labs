//
//  HeroModel.swift
//  HeroRandomizer
//
//  Created by Arman Myrzakanurov on 27.11.2024.
//

import Foundation

struct HeroModel: Codable {
    let name: String
    let images: Image

    struct Image: Codable {
        let sm: String
    }
}
