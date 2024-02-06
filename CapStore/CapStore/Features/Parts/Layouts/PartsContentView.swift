//
//  PartsContentView.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Section{
                PartsContent()
            }header: {
                PartsHeader()
                    .frame(maxHeight:160)
                Divider()
            }
            
        }
        .padding()
    }
}

#Preview {
    PartsContentView()
}
