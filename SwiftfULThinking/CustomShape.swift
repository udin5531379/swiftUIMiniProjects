//
//  CustomShape.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/5/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        let widthOffset = rect.width * 0.2
        
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - widthOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + widthOffset, y: rect.midY))
        }
    }
}

struct Trapazoid: Shape {
    func path(in rect: CGRect) -> Path {
        let widthOffset = rect.width * 0.2
        return Path { path in
            path.move(to: CGPoint(x: rect.minX + widthOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - widthOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + widthOffset, y: rect.minY))
        }
    }
}

struct CustomShape: View {
    var body: some View {
        VStack {
            Diamond()
                .frame(width: 200, height: 200)
            Triangle()
                .frame(width: 200, height: 200)
            Trapazoid()
                .frame(width: 200, height: 100)
        }
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape()
    }
}
