//
//  InventoryOperationItem.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/18.
//

import SwiftUI

struct InventoryOperationItem: View {
    private let model : InventoryOperationModel
    
    public init(model: InventoryOperationModel) {
        self.model = model
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
    InventoryOperationItem(model: InventoryOperationModel.SAMPLES.first!)
}
