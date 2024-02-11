//
//  PartsHeader.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsHeader: View {
    
    public let model:PartsHeaderModels;
    
    init(model: PartsHeaderModels) {
        self.model = model
    }
    
    var body: some View {
        HStack(alignment:.top){
            PartsImage(model: model.imageModel)
            HStack(alignment:.firstTextBaseline){
                PartsCard(model: model.partsCardModel)
                Spacer()
                HStack(alignment:.firstTextBaseline){
                    Image(systemName: model.category.image ?? "globe")
                        .foregroundColor(Color.blue)
                    Text(model.category.name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    PartsHeader(model: PartsHeaderModels.SAMPLE)
}
