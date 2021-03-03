import SwiftUI

struct PokemonStatsView: View {
    var statsDict: [String: Int] = [:]
    private let pokemonHeight: String
    private let pokemonWeight: String
    private let pokemonAbilities: [String]
    private let pokemonBaseExperience: String
    
    init(pokemon: SchemaPokemon?) {
        let statsNames = pokemon?.stats?.map({ $0.stat?.name! }) ?? []
        let statsBases = pokemon?.stats?.map({ $0.baseStat! }) ?? []
        
        for (index, element) in statsNames.enumerated() {
            self.statsDict[element!] = statsBases[index]
        }
        self.pokemonAbilities = pokemon?.abilities?.map({ $0.ability?.name?.capitalized ?? "" }) ?? ["None"]
        self.pokemonBaseExperience = "\(pokemon?.baseExperience ?? 0)"
        let height = Double(pokemon?.height ?? 0)
        self.pokemonHeight = String(format: "%.1f m", height / 10)
        let weight = Double(pokemon?.weight ?? 0)
        self.pokemonWeight = String(format: "%.1f kg", weight / 10)
    }
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    VStack(alignment: .leading) {
                        Text("Statistics")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Rectangle()
                            .fill(Color.primary)
                            .frame(height: 1)
                            .opacity(0.1)
                        
                        StatisticView(title: "HP", icon: "suit.heart.fill", value: self.statsDict["hp"] ?? 0, color: Color.red)
                        StatisticView(title: "Attack", icon: "flame.fill", value: self.statsDict["attack"] ?? 0, color: Color.orange)
                        StatisticView(title: "Defense", icon: "shield.checkerboard", value: self.statsDict["defense"] ?? 0, color: Color.blue)
                        StatisticView(title: "Speed", icon: "bolt.fill", value: self.statsDict["speed"] ?? 0, color: Color.yellow)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Profile")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Rectangle()
                            .fill(Color.primary)
                            .frame(height: 1)
                            .opacity(0.1)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Height:").bold()
                                Spacer()
                                Text(self.pokemonHeight)
                            }
                            HStack {
                                Text("Weight:").bold()
                                Spacer()
                                Text(self.pokemonWeight)
                            }
                            
                            HStack {
                                Text("Abilities:").bold()
                                Spacer()
                                Text(self.pokemonAbilities.joined(separator: ", "))
                            }
                            
                            HStack {
                                Text("Base Experience:").bold()
                                Spacer()
                                Text(self.pokemonBaseExperience)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                }
                .padding()
                .padding(.bottom, 30)
            }
        }
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView(pokemon: nil)
    }
}
