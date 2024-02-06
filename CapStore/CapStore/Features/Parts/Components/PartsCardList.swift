//
//  PartsCardList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCardList: View {
    @Binding var selection : UUID?
    
    @ObservedObject var partsCardViewModel = PartsCardViewModel()
    
    var body: some View {
        List(selection : $selection){
            ForEach(partsCardViewModel.models){ model in
                PartsCard(model: model)
                    .onAppear(){
                        self.partsCardViewModel.fetchNext()
                    }
            }
        }
    }
}

#Preview {
    PartsCardList(selection: .constant(nil))
}
