//
//  PartsContentView.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsContentView: View {
    
    public let headerModel : PartsHeaderModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Section{
                PartsContent()
            }header: {
                PartsHeader(model: self.headerModel)
                    .frame(maxHeight:160)
                Divider()
            }
            
        }
        .padding()
    }
}

#Preview {
    PartsContentView(headerModel: PartsHeaderModel.SAMPLE)
}
