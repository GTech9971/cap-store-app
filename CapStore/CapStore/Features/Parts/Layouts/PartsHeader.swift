//
//  PartsHeader.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsHeader: View {
    
    public let model:PartsHeaderModel?;
    
    init(model: PartsHeaderModel?) {
        self.model = model
    }
    
    var body: some View {
        if let model = self.model {
            HStack{
                VStack{
                    PartsImage(model: model.imageModel)
                    Spacer()
                }
                Spacer()
                HStack{
                    VStack{
                        PartsCard(model: model.partsCardModel)
                        Spacer()
                    }
                    Spacer()
                    VStack{
                        HStack{
                            Image(systemName: model.category.image ?? "globe")
                                .foregroundColor(Color.blue)
                            Text(model.category.name)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .frame(maxHeight: 160)
        }else{
            Text("Empty")
        }
    }
}

#Preview {
    PartsHeader(model: PartsHeaderModel.SAMPLE)
}
