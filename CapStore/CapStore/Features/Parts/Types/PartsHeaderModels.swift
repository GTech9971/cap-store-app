//
//  PartsHeaderModels.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/11.
//

import Foundation
import Domains

struct PartsHeaderModels{
    public let imageModel : PartsImageModel?;
    public let partsCardModel : PartsCardModel;
    public let category : Domains.Category;
    
    public init(component : Component) {
        self.imageModel = PartsImageModel(images: component.images)
        self.partsCardModel = PartsCardModel(componentId: component.componentId,
                                             name: component.name,
                                             modelName: component.modelName,
                                             makerName: component.maker.name)
        self.category = component.category
    }
    
    public static let SAMPLE : PartsHeaderModels = PartsHeaderModels(component:Component.SAMPLE)
}
