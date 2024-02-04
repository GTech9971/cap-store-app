//
//  PartCard.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCard: View {
    private let model : PartsCardModel
    
    public init(model: PartsCardModel) {
        self.model = model;
    }
    
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                Text(model.name)
                    .font(.headline);
                Text(model.modelName)
                    .font(.subheadline)
                Text(model.makerName)
                    .font(.caption)
                    .fontWeight(.light)
            }
            .padding(.vertical, 3.0)
            .padding(.horizontal, 3.0)
        }
        .frame(maxHeight: 50)
        .padding()
        .cornerRadius(8.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        //.contentShapeでタップ領域を広げる
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    PartsCard(model: PartsCardModel.SAMPLE[0]
    )
}
