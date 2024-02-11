//
//  PartsContentModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/11.
//

import Foundation
import Domains

struct PartsContentModel{
    public let headerModel : PartsHeaderModels;
    
    public let componentName : String;
    public let description : String;
    
    
    public init(component : Component) {
        self.headerModel = PartsHeaderModels(component: component);
        
        self.componentName = component.name
        self.description = component.description
    }
    
    public static let SAMPLE : PartsContentModel = PartsContentModel(component:
                                                                        Component.SAMPLE)
    
    
}
