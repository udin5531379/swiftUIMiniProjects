//
//  CustomAnyTransition.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/1/22.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    
    static var rotationEffect: AnyTransition {
        return AnyTransition.modifier(
            active:  RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotationEffect(rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifier(rotation: rotation), identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(insertion: rotationEffect(rotation: 180), removal: rotationEffect(rotation: 78))
    }
    
}

struct CustomAnyTransition: View {
    
    @State var isRectangleShown: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if isRectangleShown {
                Rectangle()
                    .background(Color.black)
                    .frame(width: 250, height: 350)
                .cornerRadius(30)
                .transition(AnyTransition.rotateOn)
                
            }
            
            Spacer()
            
            Text("Click")
                .withDefaultButtonStyling(backgroundColor: .red)
                .onTapGesture {
                    withAnimation(.default) {
                        isRectangleShown.toggle()
                    }
                }
        }
    }
}

struct CustomAnyTransition_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnyTransition()
    }
}
