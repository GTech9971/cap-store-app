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
    @State private var selectedCategoryId : UUID?
    
    @StateObject private var viewModel: PartsHomeViewModel = PartsHomeViewModel()
    
    
    private func fetchParts(){
        //最後の要素が表示された際の処理
        Task{
            do{
                try await self.viewModel.fetchNextAsync()
            }catch(let error){
                print(error)
            }
        }
    }
    
    /// 選択中のカテゴリーIDが変更された際の処理
    /// 選択中のカテゴリーIDで絞り込み検索を行う
    private func onChangeSelectCategoryId(){
        Task{
            do{
                try await self.viewModel.fetchByCategoryIdAsync(categoryUUID: self.selectedCategoryId)
            }catch(let error){
                print(error)
            }
        }
    }
    
    var body: some View {
        NavigationSplitView{
            CategoryList(selection: self.$selectedCategoryId, categories: self.viewModel.categories)
                .navigationSplitViewColumnWidth(200)
                .navigationTitle("電子部品マスター")
                .onChange(of: self.selectedCategoryId){
                    self.onChangeSelectCategoryId()
                }
        }
    content:{
        PartsCardList(selection: $selectCardId, models: self.viewModel.models)
            .onScrollEnd{ model in
                //最後の要素が表示された際の処理
                self.fetchParts()
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
        
        self.fetchParts()
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
