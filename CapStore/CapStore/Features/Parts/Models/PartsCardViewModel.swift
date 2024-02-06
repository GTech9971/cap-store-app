//
//  PartsCardViewModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import Domains

class PartsCardViewModel : ObservableObject{
    
    private var pageIndex : Int = 0;
    private var pageSize : Int = 10;
    
    let fetcher : ComponentFetcher
    
    private var response : BasePageResponse<Component>? = nil;
    
    @Published var models : [PartsCardModel] = [];
    
    init() {
        fetcher = ComponentFetcher()
        try! fetcher.fetch(pageIndex: self.pageIndex, pageSize: self.pageSize) {  response in
            self.response = response;
            self.models = self.response!.data.map{
                PartsCardModel(name:$0!.name, modelName: $0!.modelName, makerName: $0!.maker.name)
            };
        }
    }
    
    func fetchNext(){
        if(self.response?.hasNextPage == false){
            return;
        }
        self.pageSize += 10;
        try! fetcher.fetch(pageIndex: self.pageIndex, pageSize: self.pageSize) {  response in
            self.response = response;
            self.models = response.data.map{
                PartsCardModel(name:$0!.name, modelName: $0!.modelName, makerName: $0!.maker.name)
            };
        }
    }
}
