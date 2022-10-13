//
//  ViewBuilderPart2.swift
//  SwiftfULThinking
//
//  Created by Udin Rajkarnikar on 10/9/22.
//

import SwiftUI

struct ViewBuilderModel {
    var title: String
    var photographer: String
    var photoName: String
}

var viewBuilderModels : [ViewBuilderModel] = [
    ViewBuilderModel(title: "A very good picture", photographer: "Udin Rajkarnikar", photoName: "1"),
    ViewBuilderModel(title: "Captured it!!", photographer: "Hobby Jameson", photoName: "2"),
    ViewBuilderModel(title: "Mother Earth", photographer: "Sawrose Tamrakar", photoName: "3"),
    ViewBuilderModel(title: "Greenary Everywhere", photographer: "Dan Brown", photoName: "4"),
    ViewBuilderModel(title: "Something to look Forward", photographer: "Peter White", photoName: "5"),
    ViewBuilderModel(title: "Beauty", photographer: "Jhonson James", photoName: "6"),
    ViewBuilderModel(title: "Mother Earth1", photographer: "Sawrose Tamrakar", photoName: "3"),
    ViewBuilderModel(title: "Greenary Everywhere1", photographer: "Dan Brown", photoName: "4"),
    ViewBuilderModel(title: "A very good picture1", photographer: "Udin Rajkarnikar", photoName: "1"),
    ViewBuilderModel(title: "Greenary Everywhere2", photographer: "Dan Brown", photoName: "4"),
    ViewBuilderModel(title: "Something to look Forward2", photographer: "Peter White", photoName: "5"),
    ViewBuilderModel(title: "Beauty2", photographer: "Jhonson James", photoName: "6"),
    ViewBuilderModel(title: "Mother Earth12", photographer: "Sawrose Tamrakar", photoName: "3"),
    ViewBuilderModel(title: "Greenary Everywhere12", photographer: "Dan Brown", photoName: "4"),
    ViewBuilderModel(title: "A very good picture12", photographer: "Udin Rajkarnikar", photoName: "1")
]

class ViewBilderViewModel : ObservableObject {
    @Published var items = viewBuilderModels
}


//customView ko Viewbuilder
struct CustomView<Content: View, Detail: View>: View {
    var content: Content
    var detail: Detail
    
    var columnCount : [GridItem]
    
    init(columnCount: [GridItem], @ViewBuilder content: () -> Content, @ViewBuilder detail: () -> Detail){
        self.content = content()
        self.detail = detail()
        self.columnCount = columnCount
    }
    
    var body : some View {
        
        if columnCount.count == 1 {
            HStack(spacing: 15){
                content
                detail
                Spacer()
            }
            .padding(.horizontal)
        } else {
            VStack {
                content
                detail
            }.padding(.vertical)
            
        }
    }
}


struct ViewBuilderPart2: View {
    
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @StateObject var modelData = ViewBilderViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: columns) {
                    
                    ForEach(modelData.items, id: \.title) { item in
                        
                        CustomView(columnCount: columns) {
                            Image(item.photoName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                
                        } detail: {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .fontWeight(.medium)
                                    .lineLimit(1)
                                    
                                    
                                Text("By: \(item.photographer)")
                                    .fontWeight(.light)
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                    .padding(columns.count == 1 ? verticalPadding(topPadding: 20, bottomPadding: 30) : verticalPadding(topPadding: 0, bottomPadding: 0))
                            }.padding(columns.count == 2 ? horizontalPadding(leadingPadding: 20, trailingPadding: 20) : horizontalPadding(leadingPadding: 0, trailingPadding: 0))
                        }

                    }
                }
            }
            .navigationTitle("View Builder")
            .toolbar {
                Button {
                    withAnimation(.easeInOut) {
                        if columns.count == 2 {
                            columns.removeLast()
                        } else {
                            columns.append(GridItem(.flexible() , spacing: 15))
                        }
                    }
                } label: {
                    Image(systemName: columns.count == 1 ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
               
        }
        
    }
    
    func verticalPadding(topPadding: CGFloat, bottomPadding: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: topPadding, leading: 0, bottom: bottomPadding, trailing: 0)
    }
    
    func horizontalPadding(leadingPadding: CGFloat, trailingPadding: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: leadingPadding, bottom: 0, trailing: trailingPadding)
    }
}

struct ViewBuilderPart2_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderPart2()
    }
}
