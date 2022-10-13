//
//  ButtonStyleBootcamp.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/1/22.
//

import SwiftUI

struct ButtonPressableStyle: ButtonStyle {
    
    let scaleFactor: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleFactor : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

extension View {
    func withPressableStyle(scaleFactor: CGFloat) -> some View {
        buttonStyle(ButtonPressableStyle(scaleFactor: scaleFactor))
    }
}

struct ButtonStyleBootcamp: View {
    
    var buttonname: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonname)
                .withDefaultButtonStyling(backgroundColor: Color.red)
       }
        .padding()
        .withPressableStyle(scaleFactor: 0.95)

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp(buttonname: "Dummy")
    }
}
