//
//  WaterWaves.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/6/22.
//

import SwiftUI

struct WaterWavesDemo: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40)) //if control point reaches 0.50 and the path to add the curve is midY then it will be a flat line.
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct WaterWaves: View {
    var body: some View {
        WaterWavesDemo()
            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]),
                                 startPoint: .topLeading,
                                 endPoint: .bottomTrailing))
            .ignoresSafeArea()
    }
}

struct WaterWaves_Previews: PreviewProvider {
    static var previews: some View {
        WaterWaves()
    }
}
