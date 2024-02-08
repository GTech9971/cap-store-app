//
//  PartsCardList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCardList: View {
    @Binding var selection : UUID?
    let models: [PartsCardModel];
    
    typealias onScrollEndType = (PartsCardModel) -> Void
    private var onScrollEnd : onScrollEndType?
    
    init(selection: Binding<UUID?>, models: [PartsCardModel], onScrollEnd: onScrollEndType? = nil) {
        self._selection = selection
        self.models = models
        self.onScrollEnd = onScrollEnd
    }
    
    var body: some View {
        List(selection : $selection){
            ForEach(self.models){ model in
                PartsCard(model: model)
                    .onAppear{
                        //最後の要素かどうかを確認し、そうであればクロージャーを呼び出す
                        if let lastModel = self.models.last{
                            self.onScrollEnd?(lastModel)
                        }
                    }
            }
        }
    }
    
    ///
    ///こんなふうに書くと呼び出し元でかっこよくかける
    func onScrollEnd(perform action: @escaping onScrollEndType) -> some View {
        var copy = self
        copy.onScrollEnd = action
        _ = copy.onScrollEnd // Avoiding unused variable warning
        _ = copy.body // Triggering view update
        return copy
    }
}

#Preview {
    PartsCardList(selection: .constant(nil), models: PartsCardModel.SAMPLE)
}
