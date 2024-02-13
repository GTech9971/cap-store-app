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
    
    @StateObject private var partsCardViewModel: PartsCardViewModel =
        .init(dataSource: ComponentFetcher())
    
    var body: some View {
        NavigationSplitView{
            CategoryList()
                .navigationSplitViewColumnWidth(180)
        }
    content:{
        PartsCardList(selection: $selectCardId, models: self.partsCardViewModel.models)
            .onScrollEnd{ model in
                //最後の要素が表示された際の処理
                Task{
                    do{
                        try await self.partsCardViewModel.fetchPartsCard()
                    }catch(let error){
                        print(error)
                    }
                }
            }
            .navigationSplitViewColumnWidth(250)
    }
    detail: {
            PartsContentView(model: self.partsCardViewModel.getByUUID(uuid: self.$selectCardId.wrappedValue))
        Spacer()
    }
    .navigationTitle("電子部品マスター")
    .task {
        //.taskという形式で書かないとエラー
        //SwiftUIではViewが表示されるタイミングで１度だけ呼ばれるコールバックメソッドとして.onAppear、 .task があります。
        //https://zenn.dev/tomo_devl/articles/65f1d1fd518bf5
        do{
            try await self.partsCardViewModel.fetchPartsCard()
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
