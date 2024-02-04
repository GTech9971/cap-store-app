//
//  CategoryLinkItem.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct CategoryLinkItem: View {
    private let model : CategoryLinkModel
    
    public init(model: CategoryLinkModel) {
        self.model = model
    }
    
    var body: some View {
        Label{
            Text(model.name)
        } icon :{
            Image(systemName: model.image!)
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    CategoryLinkItem(model: CategoryLinkModel.SAMPLES[0])
}
