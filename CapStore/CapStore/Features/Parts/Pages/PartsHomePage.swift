//
//  PartsHome.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI


struct PartsHomePage: View {
    @State private var selectCategoryId : UUID?;
    @State private var searchText : String = "";
    
    var body: some View {
        NavigationSplitView{
            CategoryList()
                .navigationSplitViewColumnWidth(180)
        }
    content:{
        PartsCardList(selection: $selectCategoryId)
            .navigationSplitViewColumnWidth(ideal:120)
    }
    detail: {
        PartsContentView()
    }
    .navigationTitle("電子部品マスター")
    .toolbar(content: {
        ToolbarItem(id:"new", placement: .navigation){
            Button(action:{}, label:{
                Label("new", systemImage: "square.and.pencil")
            })
        }
        ToolbarItem(id:"trash", placement: .destructiveAction){
            Button(action:{}, label:{
                Label("trach", systemImage: "trash")
            })
        }
        ToolbarItem(id:"upload", placement: .secondaryAction){
            Button(action: {}, label: {
                Label("upload", systemImage: "square.and.arrow.up")
            })
        }
    })
    .searchable(text: $searchText)
        
    }
}

#Preview {
    PartsHomePage()
}
