//
//  PartsCardViewModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import Domains

class PartsCardViewModel : ObservableObject{
    private let INCREASE : Int = 10
    
    private var pageIndex:Int = 0;
    private var pageSize:Int = 0;
    
    private var hasNextPage : Bool? = true
    
    @Published private(set) var models : [PartsCardModel] = [];
    private let dataSource: ComponentFetcher
    
    init(dataSource: ComponentFetcher) {
        self.dataSource = dataSource
    }
    
    func fetchPartsCard() async throws{
        if(self.hasNextPage == false){
            return;
        }
        
        self.pageSize += INCREASE;
        let response :BasePageResponse<Component> = try await self.dataSource.fetchAsync(pageIndex: self.pageIndex, pageSize: self.pageSize)
        
        self.hasNextPage = response.hasNextPage
        
        self.models = response
            .data
            .filter{$0 != nil}
            .map{ data in
                guard let data = data else{
                    fatalError()
                }
                return PartsCardModel(
                    componentId: data.componentId, name:data.name, modelName: data.modelName, makerName: data.maker.name
                )
            }
    }
    
    func getByUUID(uuid:UUID) -> PartsCardModel?{
        return self.models
            .filter{$0.id == uuid}
            .first
    }
}
