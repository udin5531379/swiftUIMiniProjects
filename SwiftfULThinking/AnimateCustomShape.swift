//
//  AnimateCustomShape.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/6/22.


import SwiftUI

struct AnimatingCornerRadiusShape: Shape {
    
    var cornerRadius: Double
    
    var animatableData: CGFloat {
        get {
            cornerRadius
        }
        
        set(newValue) {
            cornerRadius = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            
            path.addArc(center: CGPoint(x: rect.maxY - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct AnimateCustomShape: View {
    var cornerRadius: Double = 60
    @State private var animating : Bool = false
    var body: some View {
        AnimatingCornerRadiusShape(cornerRadius: animating ? cornerRadius : 0)
            .frame(width: 200, height: 200)
            .onAppear{
                withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                    animating.toggle()
                }
            }
    }
}

struct AnimateCustomShape_Previews: PreviewProvider {
    static var previews: some View {
        AnimateCustomShape()
    }
}
