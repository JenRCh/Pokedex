import SwiftUI
//import SDWebImageSwiftUI

struct PokemonCardView: View {
    let id: Int
    let isAnimated: Bool
    @ObservedObject var pokeStore: Pokemon
    @Environment(\.colorScheme) var colorScheme
    @State private var name: String = ""
    @State private var skills: [String] = []
    @State private var color: Color?
   // @State private var image: WebImage?
    private let degrees: Double = 5
    
    func updateData() {
        self.pokeStore.getPokemonSpecie(pokemonId: id) { specie in
            color = Color(name: specie.color.name!)
        }

        self.pokeStore.getPokemon(pokemonId: id) { content in
            name = content.name!.capitalized
            skills = content.types?.map { $0.type?.name ?? "" } ?? []
            let imageUrl = content.sprites?.other?.officialArtwork?.frontDefault
          //  image = WebImage(url: URL(string: imageUrl!))
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                
                Text(name)
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(radius: 3)
                    .lineLimit(1)
                
                VStack(alignment: .leading, spacing: 11.0) {
                    Text("Types")
                        .bold()
                        .foregroundColor(.white)
                    
                    HStack {
                        ForEach(self.skills, id: \.self) { skill in
                            Text(skill.capitalized)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(
                                    Color.primary
                                        .opacity(0.15)
                                        .cornerRadius(25)
                                )
                                .transition(
                                    AnyTransition.move(edge: .trailing)
                                        //.combined(with: .fade)
                                        .animation(isAnimated ? Animation.easeIn.delay(0.7) : nil)
                                )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.leading, 16)
            .rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0),
                anchor: .leading
            )
            
//            image?
//                .resizable()
//                .indicator(.activity)
//                .transition(.fade(duration: 1))
//                .scaledToFit()
//                .shadow(radius: 3)
//                .scaleEffect(1.4)
//                .frame(width: 120)
//                .padding(.trailing)
//
        }
        .background(
            ZStack(alignment: .leading) {
                BlurView(style: .systemUltraThinMaterial)
                    .opacity(0.8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(
                                colorScheme == .dark ? Color.black.opacity(0.3) : Color.white.opacity(0.3),
                                lineWidth: 1
                            )
                            .opacity(0.5)
                    )
                color?
                    .opacity(0.5)
                    .frame(width: 20)
            }
            .frame(height: 150)
            .cornerRadius(25)
            .rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0),
                anchor: .leading
            )
        )
        .frame(height: 150)
        .padding(.horizontal)
        .transition(.move(edge: .trailing))
        .animation(isAnimated ? Animation.easeInOut(duration: 1).delay(Double(id) * 0.1) : nil)
        .onAppear(perform: updateData)
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(id: 1, isAnimated: true, pokeStore: Pokemon())
    }
}
