//
//  PartsContentView.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsContentView: View {
    
    public let model:PartsContentModel?
    
    var body: some View {
        if let model = self.model{
            VStack(alignment: .leading){
                Section{
                    PartsContent(model:model)
                }header: {
                    PartsHeader(model: model.headerModel)
                        .frame(maxHeight:160)
                    Divider()
                        .padding()
                }
            }
            .padding()
        }else{
            VStack(alignment:.center){
                Text("電子部品未選択")
            }
            .padding()
        }
    }
}

#Preview {
    PartsContentView(model: PartsContentModel.SAMPLE)
}
