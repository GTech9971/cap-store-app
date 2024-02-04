//
//  PartsCardList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCardList: View {
    @State private var selection : UUID?
    
    var body: some View {
        List(selection : $selection){
            ForEach(PartsCardModel.SAMPLE){ sample in
                PartsCard(model: sample)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    PartsCardList()
}
