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
    
    
    private func fetchInitAsync() async{
        do{
            try await self.registryViewModel.fetchAllCategoriesAsync()
            try await self.registryViewModel.fetchAllMakersAsync()
        }catch(let error){
            print(error)
        }
    }
    
    private func fetchComponentByCatalogId(catalogId:CatalogId) async{
        do{
            try await self.registryViewModel.fetchComponentAsync(catalogId: catalogId)
            guard let component = self.registryViewModel.component else{
                print("Not Found")
                return
            }
            
            self.name = component.name
            self.modelName = component.modelName
            self.selectedCategory = component.category
            self.selectedMaker = component.maker
            self.description = component.description
            self.image = PartsImageModel(images: component.images)
        }catch(let error){
            print(error)
        }
    }
    
    var body: some View {
        
        VStack{
            NavigationStack{
                
                Form{
                    Section(header:Text("秋月電子")){
                        TextField("通販コード", text:self.$catalogId, prompt: Text("通販コード : 114430"))
                    }
                    
                    Section(header:Text("電子部品情報")){
                        
                        TextField("電子部品名", text:self.$name, prompt: Text("PIC16F18444"))
                            .onChange(of: self.catalogId){
                                Task{
                                    let catalogId = CatalogId(id: self.catalogId)
                                    await fetchComponentByCatalogId(catalogId:catalogId)
                                }
                            }
                        TextField("モデル名", text:self.$modelName, prompt: Text("PIC16F18444-I/P"))
                        Picker("カテゴリー:", selection: self.$selectedCategory){
                            ForEach(self.registryViewModel.categories){
                                Text($0.name).tag(Optional($0))
                            }
                        }
                        .frame(width:.infinity)
                        Picker("メーカー:", selection: self.$selectedMaker){
                            ForEach(self.registryViewModel.makers){
                                Text($0.name).tag(Optional($0))
                            }
                        }
                        .frame(width:.infinity)
                        PartsImage(model: self.image, minWidth: 100, minHeight: 100)
                        Section(header:Text("説明")){
                            TextEditor(text: self.$description)
                                .border(.gray)
                                .font(.caption)
                                .frame(width:.infinity, height: 100)
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
