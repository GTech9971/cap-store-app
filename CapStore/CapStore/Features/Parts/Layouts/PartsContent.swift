//
//  PartsContent.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsContent: View {
    
    public let model : PartsContentModel
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(systemName: "doc")
                    .foregroundColor(.blue)
                Text(self.model.componentName)
                    .fontWeight(.light)
            }
            .padding(.bottom)
            Text(self.model.description)
        }
        .padding()
    }
}

#Preview {
    PartsContent(model:PartsContentModel.SAMPLE)
}
