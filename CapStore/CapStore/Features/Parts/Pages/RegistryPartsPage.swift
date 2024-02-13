//
//  RegistryPartsPage.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/12.
//

import SwiftUI
import Domains

struct RegistryPartsPage: View {
    
    @StateObject private var registryViewModel : RegistryPartsViewModel = .init(dataSourceCategory: CategoryFetcher(), dateSourceMaker: MakerFetcher(), dataSourceComponent: ComponentFetcher())
    
    @State var catalogId : String = "";
    
    @State var name : String =  "";
    @State var modelName : String = "";
    @State var selectedCategory : Domains.Category? = nil;
    @State var selectedMaker : Maker? = nil;
    @State var description : String = "";
    @State var image:PartsImageModel? = nil;
    
    @State private var isShowNotFoundAlert : Bool = false
    @State private var isShowFetchErrorAlert : Bool = false
    
    @State private var error: Error? = nil
    
    private func fetchInitAsync() async{
        do{
            try await self.registryViewModel.fetchAllCategoriesAsync()
            try await self.registryViewModel.fetchAllMakersAsync()
        }catch(let error){
            self.isShowFetchErrorAlert = true;
            self.error = error;
        }
    }
    
    private func fetchComponentByCatalogId(catalogId:CatalogId) async{
        do{
            try await self.registryViewModel.fetchComponentAsync(catalogId: catalogId)
            guard let component = self.registryViewModel.component else{
                self.isShowNotFoundAlert = true;
                return
            }
            
            self.name = component.name
            self.modelName = component.modelName
            
            self.selectedCategory = self.registryViewModel.categories.filter({$0.categoryId == component.category.categoryId}).first
            
            self.selectedMaker = self.registryViewModel.makers.filter({$0.makerId == component.maker.makerId}).first
            
            self.description = component.description
            self.image = PartsImageModel(images: component.images)
        }catch(let error){
            self.isShowFetchErrorAlert = true;
            self.error = error;
        }
    }
    
    
    private var searchButton : some View{
        Button("検索"){
            Task{
                let catalogId = CatalogId(id: self.catalogId)
                await fetchComponentByCatalogId(catalogId:catalogId)
            }
        }
        .alert("NotFound", isPresented: self.$isShowNotFoundAlert){
            //Action
        }message: {
            Text("カタログID:\(self.catalogId)が存在しません")
        }
        .alert("Error", isPresented: self.$isShowFetchErrorAlert){
                //
        }message: {
            guard let error = self.error else{
                return Text("")
            }
            return Text(error.localizedDescription)
        }
    }
    
    var body: some View {
        
        VStack{
            NavigationStack{
                
                Form{
                    Section(header:Text("秋月電子"), footer: searchButton){
                        TextField("通販コード", text:self.$catalogId, prompt: Text("通販コード : 114430"))
                    }
                    
                    Section(header:Text("電子部品情報")){
                        TextField("電子部品名", text:self.$name, prompt: Text("PIC16F18444"))
                        TextField("モデル名", text:self.$modelName, prompt: Text("PIC16F18444-I/P"))
                        Picker("カテゴリー:", selection: self.$selectedCategory){
                            ForEach(self.registryViewModel.categories){
                                Text($0.name).tag(Optional($0))
                            }
                        }
                        Picker("メーカー:", selection: self.$selectedMaker){
                            ForEach(self.registryViewModel.makers){
                                Text($0.name).tag(Optional($0))
                            }
                        }
                        PartsImage(model: self.image, minWidth: 100, minHeight: 100)
                        Section(header:Text("説明")){
                            TextEditor(text: self.$description)
                                .border(.gray)
                                .font(.caption)
                                .frame(height: 100)
                                .opacity(0.8)
                        }
                    }
                    
                }
                .formStyle(.grouped)
                
            }
            .navigationTitle("電子部品登録")
            
            Divider()
            
            HStack{
                Spacer()
                Button("キャンセル"){
                    
                }
                Button("保存"){
                    
                }
                
            }
            .padding()
        }
        .task {
            await fetchInitAsync()
        }
        
    }
    
}

#Preview {
    RegistryPartsPage()
}
