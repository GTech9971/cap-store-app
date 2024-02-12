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
    
    private var response : BasePageResponse<Component>? = nil
    
    @Published private(set) var models : [PartsCardModel] = [];
    
    private let dataSource: ComponentFetcher
    
    init(dataSource: ComponentFetcher) {
        self.dataSource = dataSource
    }
    
    
    /// 電子部品情報を取得する
    func fetchPartsCard() async throws{
        if(self.hasNextPage == false){
            return;
        }
        
        self.pageSize += INCREASE;
        let response :BasePageResponse<Component> = try await self.dataSource.fetchAsync(pageIndex: self.pageIndex, pageSize: self.pageSize)
        self.response = response;
        self.hasNextPage = response.hasNextPage
        
        if let data = response.data{
            self.models = data
                .compactMap({$0})
                .map{ data in
                    return PartsCardModel(
                        componentId: data.componentId, name:data.name, modelName: data.modelName, makerName: data.maker.name
                    )
                }
        }
    }
    
    /// 選択中の電子部品カードモデルを取得する
    /// - Parameter uuid: 選択中のUUID
    /// - Returns:電子部品カードモデル
    func getByUUID(uuid:UUID) -> PartsCardModel?{
        return self.models
            .filter{$0.id == uuid}
            .first
    }
    
    
    /// 選択中の電子部品IDを取得する
    /// - Parameter uuid: 選択中のUUID
    /// - Returns: 電子部品ID
    func getComponentIdByUUID(uuid:UUID) -> Int?{
        return self.models
            .filter({$0.id == uuid})
            .map({$0.componentId})
            .first
    }
    
    
    /// 選択中の電子部品コンテントモデルを取得する
    /// - Parameter uuid: 選択中のUUID
    /// - Returns: 電子部品コンテントモデル
    func getByUUID(uuid:UUID?) -> PartsContentModel?{
        guard let uuid = uuid else{
            return nil
        }
        
        guard let response = self.response else{
            return nil;
        }
        
        guard let id : Int = self.getComponentIdByUUID(uuid: uuid) else{
            return nil;
        }
        
        guard let data = response.data else{
            return nil;
        }
        
        let component : Component? = data
            .compactMap({$0})
            .filter({ data in
                return data.componentId == id
            })
            .first
        
        guard let component : Component = component else{
            return nil
        }
        
        return PartsContentModel(component: component)
    }
}
