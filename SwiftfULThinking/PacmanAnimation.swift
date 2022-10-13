//
//  PacmanAnimation.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/7/22.
//

import SwiftUI

struct Pacman: Shape {
    
    var startAngle: Double = 30 //else 0
    var endAngle: Double = 340 //else 360
    
    var animatableData: Double {
        get {
            startAngle
          
        }
        
        set(newValue) {
            startAngle = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midY, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 100, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: 360 - startAngle), clockwise: false)
        }
    }
}

struct PacmanAnimation: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        Pacman(startAngle: isAnimating ? 0 : 30)
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.5).repeatForever()) {
                    isAnimating.toggle()
                }
            }
    }
}

struct PacmanAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PacmanAnimation()
    }
}
