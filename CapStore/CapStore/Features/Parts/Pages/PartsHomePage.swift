//
//  PartsHome.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI
import Domains


struct PartsHomePage: View {
    
    @Environment(\.openWindow) private var openWindow
    
    @State private var selectCardId : UUID?;
    @State private var searchText : String = "";
    @State private var selectedCategory : Domains.Category?
    
    @StateObject private var viewModel: PartsHomeViewModel = PartsHomeViewModel()
    
    var body: some View {
        NavigationSplitView{
            CategoryList(selection: self.$selectedCategory, categories: self.viewModel.categories)
                .navigationSplitViewColumnWidth(200)
        }
    content:{
        PartsCardList(selection: $selectCardId, models: self.viewModel.models)
            .onScrollEnd{ model in
                //最後の要素が表示された際の処理
                Task{
                    do{
                        try await self.viewModel.fetchPartsCard()
                    }catch(let error){
                        print(error)
                    }
                }
            }
            .navigationSplitViewColumnWidth(300)
    }
    detail: {
            PartsContentView(model: self.viewModel.getByUUID(uuid: self.$selectCardId.wrappedValue))
        Spacer()
    }
    .navigationTitle("電子部品マスター")
    .task {
        //カテゴリー取得
        do{
            try await self.viewModel.fetchAllCategoriesAsync()
        }catch(let error){
            print(error)
        }
        
        //電子部品取得
        //https://zenn.dev/tomo_devl/articles/65f1d1fd518bf5
        do{
            try await self.viewModel.fetchPartsCard()
        }catch(let error){
            print(error)
        }
    }
    .frame(minWidth: 1000, idealWidth: 1200, minHeight: 500, idealHeight: 600)
    .toolbar(content: {
        ToolbarItem(id:"new", placement: .navigation){
            Button(action:{
                openWindow(id: "registry")
            }, label:{
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
        //TODO
    }
}

#Preview {
    PartsHomePage()
}
