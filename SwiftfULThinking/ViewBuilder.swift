//
//  ViewBuilder.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/7/22.
//

import SwiftUI

struct AnyView<T:View> : View {
    
    let content: T
    
    var body: some View {
        content
    }
}

struct ViewWithViewBuilder<Content:View> : View {
    
    var content: Content
    var title: String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Text("\(title)")
            content
        }
        
    }
}


struct ViewBuilderExample: View {
    var body: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 2)
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                Text("Online with buzz")
                Spacer()
            }.padding(.horizontal)
            
            Rectangle()
                .frame(width: .infinity, height: 2.0)
                .padding(.horizontal)
            
            Spacer()
            
            AnyView(content: Text("Hello"))
            
            ViewWithViewBuilder(title: "Hello1") {
                VStack {
                    Text("Hello2")
                    Text("Hello3")
                }
            }
            
            
        }
    }
}

struct ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderExample()
    }
}
