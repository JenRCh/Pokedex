import SwiftUI


struct StatisticView: View {
    let title: String
    let icon: String
    let value: Int
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.primary)
            
            ZStack {
                
                Color.black
                    .opacity(0.1)
                    .overlay(
                        GeometryReader { metrics in
                            Color.white
                                .cornerRadius(25)
                                .frame(width: metrics.size.width * CGFloat(value) / 100 )
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    )
                    .frame(height: 32)
                    .cornerRadius(25)
                
                HStack {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(color)
                        .frame(width: 32)
                        .scaleEffect(1.2)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 1, height: 12)
                        .opacity(0.1)
                        .blendMode(.darken)
                    
                    // largest number string is "100"
                    Text("100")
                        .opacity(0)
                        .overlay(
                            Text("\(value)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .blendMode(.darken)
                        )
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 8)
    }
}


struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            StatisticView(title: "HP", icon: "heart.fill", value: 80, color: Color.red)
                .padding()
        }
    }
}
