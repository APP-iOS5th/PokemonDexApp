//
//  ListVIewModel.swift
//  Team0418Pokemon
//
//  Created by 백동현 on 5/1/24.
//

import Foundation

@Observable
final class ListVIewModel {
  private let service: ListUseCase

  private(set) var pokeList: [Pokemon] = [Pokemon]()

  init(service: ListUseCase) {
    self.service = service
  }

  func loadList(with offset: Int, limit: Int) async {
    pokeList = await service.request(with: offset, limit)
  }
}

final class MockService: ListUseCase {
  func request(with offset: Int, _ limit: Int) async -> [Pokemon] {
    return [
      Pokemon(id: 1, name: "bulbasaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
      Pokemon(id: 2, name: "ivysaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"),
      Pokemon(id: 3, name: "venusaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),
      Pokemon(id: 4, name: "charmander", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),
      Pokemon(id: 5, name: "charmeleon", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),
      Pokemon(id: 6, name: "charizard", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png"),
      Pokemon(id: 7, name: "squirtle", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"),
      Pokemon(id: 8, name: "wartortle", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"),
      Pokemon(id: 9, name: "blastoise", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png"),
      Pokemon(id: 10, name: "caterpie", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png")
    ]
  }

}
