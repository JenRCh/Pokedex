import SwiftUI

struct HomeView: View {
    @StateObject private var pokeStore = Pokemon()
    @Environment(\.colorScheme) var colorScheme
    @State private var searchInput: String = ""
    @State private var selectedPokemon: Int? = nil
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
//            Image(uiImage: #imageLiteral(resourceName: "tg_image_4069414066"))
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.2)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Pokemon")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    LazyVStack(alignment: .center, spacing: nil, pinnedViews: [.sectionHeaders]) {
                        Section() {
                            let zipOfPokemons = zip(self.pokeStore.pokemons.indices, self.pokeStore.pokemons)
                            ForEach(Array(zipOfPokemons), id: \.0) { index, pokemon in
                                let isAnimated = index < 5
                                PokemonCardView(id: index + 1, isAnimated: isAnimated, pokeStore: pokeStore)
                                    .onTapGesture {
                                        self.selectedPokemon = index + 1
                                    }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
            
            if let selectedPokemon = selectedPokemon {
                PokemonDetailsView(pokemonId: selectedPokemon, pokeStore: self.pokeStore)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.easeInOut(duration: 0.5))
                
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                    .background(
                        BlurView(style: colorScheme == .dark ? .systemUltraThinMaterialLight : .systemUltraThinMaterialDark)
                    )
                    .clipShape(Circle())
                    .padding()
                    .transition(AnyTransition.move(edge: .trailing))
                    .animation(Animation.easeInOut.delay(0.3))
                    .onTapGesture {
                        self.selectedPokemon = nil
                    }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

