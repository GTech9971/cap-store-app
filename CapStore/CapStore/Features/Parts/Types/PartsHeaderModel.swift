//
//  PartsHeaderModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/09.
//

import Foundation
import Domains

struct PartsHeaderModel{
    public let imageModel : PartsImageModel;
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
    
    public static let SAMPLE : PartsHeaderModel =
    PartsHeaderModel(component:
                        Component(componentId: 0,
                                  name: "PIC16F18444", modelName: "PIC16F18444-I/P",
                                  description: "",
                                  category: Category(
                                    id:0,
                                    name: "マイコン",
                                    image: "globe"
                                  ),
                                  maker: Maker(
                                    id: 0,
                                    name:"Microchip Technology",
                                    image: nil
                                  ),
                                  images: PartsImageModel.SAMPLE.images))
}
