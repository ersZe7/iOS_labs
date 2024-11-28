//
//  HeroManager.swift
//  HeroRandomizer
//
//  Created by Arman Myrzakanurov on 27.11.2024.
//

import Foundation
import Alamofire

protocol HeroManagerDelegate {
    func onHeroDidUpdate(hero: HeroModel)
}

struct HeroManager {

    var delegate: HeroManagerDelegate?

    func fetchHero() {
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"

        AF.request(urlString).responseDecodable(of: [HeroModel].self) { response in
            switch response.result {
            case .success(let heroes):
                let randomHero = heroes.randomElement()!
                delegate?.onHeroDidUpdate(hero: randomHero)
            case .failure(let error):
                print(error)
            }
        }
    }
}
