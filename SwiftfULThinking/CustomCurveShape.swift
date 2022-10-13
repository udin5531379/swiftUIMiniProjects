//
//  CustomCurveShape.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/5/22.
//

import SwiftUI

struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height / 2, startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 360), clockwise: false)
        }
    }
    
}

struct ArcSample2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

struct QuadCurveSample: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .zero)
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                              control: CGPoint(x: rect.minY, y: rect.maxY))
        }
    }
}


struct CustomCurveShape: View {
    var body: some View {
        VStack {
            ArcSample()
                .stroke(lineWidth: 2)
            .frame(width: 200, height: 200)
            
            ArcSample2()
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: 80))
            
            QuadCurveSample()
                .frame(width: 100, height: 200)
            
           
          
        }
    }
}

struct CustomCurveShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurveShape()
    }
}
