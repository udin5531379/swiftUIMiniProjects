//
//  ViewModifierAdvanceLearning.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 9/30/22.
//

import SwiftUI

struct DefaultViewModifier : ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .font(.headline)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(color: backgroundColor.opacity(0.3), radius: 10, x: 0, y: 10.0)
            .padding()
        
    }
}

extension View {
    func withDefaultButtonStyling(backgroundColor: Color) -> some View {
        modifier(DefaultViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierAdvanceLearning: View {
    var body: some View {
        
        VStack {
            Text("Hello, World!")
                .withDefaultButtonStyling(backgroundColor: .red)
            Text("Hello, World!")
                .withDefaultButtonStyling(backgroundColor: .blue)
            Text("Hello, World!")
                .withDefaultButtonStyling(backgroundColor: .orange)
        }
    }
}

struct ViewModifierAdvanceLearning_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierAdvanceLearning()
    }
}
