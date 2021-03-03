import SwiftUI

extension Color {
    public init?(name: String) {
        let allColors = [
            "black": #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            "blue": #colorLiteral(red: 0.4666666667, green: 0.7411764706, blue: 0.9960784314, alpha: 1),
            "brown": #colorLiteral(red: 0.6470588235, green: 0.1647058824, blue: 0.1647058824, alpha: 1),
            "gray": #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1),
            "green": #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
            "pink": #colorLiteral(red: 1, green: 0.7529411765, blue: 0.7960784314, alpha: 1),
            "purple": #colorLiteral(red: 0.5019607843, green: 0, blue: 0.5019607843, alpha: 1),
            "red": #colorLiteral(red: 0.9843137255, green: 0.4235294118, blue: 0.4235294118, alpha: 1),
            "white": #colorLiteral(red: 0.4392156863, green: 0.5019607843, blue: 0.5647058824, alpha: 1),
            "yellow": #colorLiteral(red: 0.9843137255, green: 0.8039215686, blue: 0.4, alpha: 1),
        ]
        
        let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
        
        if let color = allColors[cleanedName] {
            self.init(color)
        } else {
            return nil
        }
    }
}
