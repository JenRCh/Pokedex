import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailsView: View {
    var pokemonId: Int
    @ObservedObject var pokeStore: Pokemon
    @State private var color: Color?
    @State private var pokemon: SchemaPokemon? = nil
    @State private var skills: [String] = []
    @State private var isBottomSheetOpened: Bool = false
    @State private var sizeOfBottomSheet: Double = 0
    @State private var image: WebImage?
    
    func updateData() {
        self.pokeStore.getPokemonSpecie(pokemonId: self.pokemonId) { content in
            self.color = Color(name: content.color.name!)
        }
        self.pokeStore.getPokemon(pokemonId: self.pokemonId) { (pokemon) in
            self.pokemon = pokemon
            self.skills = pokemon.types?.map { $0.type?.name ?? "" } ?? []
            let imageUrl = pokemon.sprites?.other?.officialArtwork?.frontDefault
            self.image = WebImage(url: URL(string: imageUrl!))
        }
    }
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                
                color?
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                
                BlurView(style: .systemUltraThinMaterial)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(pokemon?.name?.capitalized ?? "Bulbasaur")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                    }
                    
                    HStack {
                        
                        ForEach(skills, id: \.self) { skill in
                            Text(skill.capitalized)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(
                                    Color.primary
                                        .opacity(0.2)
                                )
                                .cornerRadius(25)
                                .padding(.vertical, 5)
                        }
                    }
                    
                    self.image?
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
                    
                    Spacer()
                }
                .padding()
                .cornerRadius(25)
                
                let maxHeight = metrics.size.height + metrics.safeAreaInsets.bottom + metrics.safeAreaInsets.top
                
                BottomSheetView(
                    isOpen: $isBottomSheetOpened,
                    maxHeight: (maxHeight) * (80 / 100),
                    minHeight: 300) {
                    PokemonStatsView(pokemon: self.pokemon)
                }
                .offset(y: max(metrics.safeAreaInsets.bottom, 25))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
                
            }
            .onAppear(perform: updateData)
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemonId: 1, pokeStore: Pokemon())
    }
}

