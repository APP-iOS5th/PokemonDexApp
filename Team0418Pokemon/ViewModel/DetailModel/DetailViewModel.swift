//
//  DetailModel.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/2/24.
//

import Foundation

@Observable
final class DetailViewModel {
    private let service: DetailUseCase
    
    private(set) var pokeDtail: PokemonDetail
    
    init(service: DetailUseCase) {
        self.service = service
        self.pokeDtail = PokemonDetail(id: 0, type: .normal, name: "", imageUrlString: "", stat: PokemonStat(hp: 100, attack: 80, defense: 70, specialAttack: 90, specialDefense: 80, speed: 110), genus: "")
        

    }
    func loadDetail(with id: Int) async {
        pokeDtail = await service.request(with: id)
    }
}

final class DetailMockService: DetailUseCase  {
    lazy var stats = PokemonStat(hp: 100, attack: 80, defense: 70, specialAttack: 90, specialDefense: 80, speed: 110)
    lazy var pomkomData: PokemonDetail = {
        PokemonDetail(id: 1, type: .grass, name: "bulbasaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", stat: stats, genus: "seed Pokemon")
    }()

    func request(with pokemonId: Int) async -> PokemonDetail {
        return PokemonDetail(id: 1, type: .grass, name: "bulbasaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", stat: stats , genus: "seed Pokemon")
    }
}

