//
//  RegistryPartsViewModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/12.
//

import Foundation
import Domains

class RegistryPartsViewModel : ObservableObject{
    private var categoryResponse : BaseResponse<Domains.Category>? = nil;
    private var makerResponse : BaseResponse<Maker>? = nil;
    private var componentResponse : BaseResponse<Component>? = nil;
    
    @Published public var categories:[Domains.Category] = [];
    @Published public var makers:[Maker] = [];
    @Published public var component:Component? = nil;
    
    private let dataSourceCategory : CategoryFetcher
    private let dateSourceMaker : MakerFetcher
    private let dataSourceComponent: ComponentFetcher
    
    init(dataSourceCategory: CategoryFetcher, dateSourceMaker: MakerFetcher, dataSourceComponent : ComponentFetcher) {
        self.dataSourceCategory = dataSourceCategory
        self.dateSourceMaker = dateSourceMaker
        self.dataSourceComponent = dataSourceComponent
    }
    
    func fetchAllCategoriesAsync() async throws{
        let response : BaseResponse<Domains.Category> = try await self.dataSourceCategory.fetchAllAsync()
        
        self.categoryResponse = response;
        
        if let data = response.data{
            self.categories = data.compactMap({$0})
        }
        
    }
    
    func fetchAllMakersAsync() async throws{
        let response : BaseResponse<Maker> = try await self.dateSourceMaker.fetchAllAsync()
        
        self.makerResponse = response;
        
        if let data = response.data{
            self.makers = data.compactMap({$0})
        }
    }
    
    func fetchComponentAsync(catalogId: CatalogId) async throws{
        let response : BaseResponse<Component> = try await self.dataSourceComponent.fetchByCatalogIdAsync(catalogId: catalogId)
        
        self.componentResponse = response;
        
        if let data = response.data{
            self.component = data.first
        }
    }
}
