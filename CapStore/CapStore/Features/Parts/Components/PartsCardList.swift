//
//  PartsCardList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCardList: View {
    @Binding var selection : UUID?
    @Binding var models: [PartsCardModel];
    
    var body: some View {
        List(selection : $selection){
            ForEach(self.models){ model in
                PartsCard(model: model)
            }
        }
    }
}

#Preview {
    PartsCardList(selection: .constant(nil), models: .constant([]))
}
