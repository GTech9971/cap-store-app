//
//  CategoryLinkItem.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI
import Domains

struct CategoryLinkItem: View {
    private let model : CategoryLinkModel
    
    public init(model: CategoryLinkModel) {
        self.model = model
    }
    
    public init(model: Domains.Category) {
        self.model = CategoryLinkModel(name: model.name, image: model.image)
    }
    
    var body: some View {
        Label{
            Text(model.name)
        } icon :{
            Image(systemName: model.image ?? "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    CategoryLinkItem(model: CategoryLinkModel.SAMPLES[0])
}
