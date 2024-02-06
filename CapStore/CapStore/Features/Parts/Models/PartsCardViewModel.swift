//
//  PartsCardViewModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import Domains

class PartsCardViewModel : ObservableObject{
    let fetcher : ComponentFetcher
    @Published var models : [PartsCardModel] = [];
    
    init() {
        fetcher = ComponentFetcher()
        try! fetcher.fetch {  data in
            self.models = data.map{
                PartsCardModel(name:$0.name, modelName: $0.modelName, makerName: $0.maker.name)
            };
        }
    }
}
