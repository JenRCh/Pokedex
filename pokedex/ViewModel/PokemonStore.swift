import SwiftUI

class Pokemon: ObservableObject {
    @Published var pokemons: [SchemaResult] = []
    
    init() {
        self.update()
    }
    
    func update() {
//        self.pokemons = []
//        for index in 1...20 {
//            self.getPokemon(pokemonId: index) { (pokemon: SchemaPokemon) in
//                self.pokemons.append(pokemon)
//            }
//        }
        getPokemonList { result in
            if let result = result {
                self.pokemons = result
            }
        }
    }
    
    func getPokemonList(completion: @escaping ([SchemaResult]?) -> ()) {
        let endpoint = "pokemon"
        API.shared.fetchAndDecode(from: endpoint) { (data: SchemaPokemonList) in
            DispatchQueue.main.async {
                completion(data.results)
            }
        }
    }
    
    func getPokemonSpecie(pokemonId: Int, completion: @escaping (SchemaPokemonSpecie) -> ()) {
        let endpoint = "pokemon-species/\(pokemonId)"
        API.shared.fetchAndDecode(from: endpoint) { (data: SchemaPokemonSpecie) in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }

    func getPokemon(pokemonId: Int, completion: @escaping (SchemaPokemon) -> ()) {
        let endpoint = "pokemon/\(pokemonId)"
        API.shared.fetchAndDecode(from: endpoint) { (data: SchemaPokemon) in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
