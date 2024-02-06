//
//  PartsHeader.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsHeader: View {
    var body: some View {
        HStack{
            VStack{
                PartsImage()
                Spacer()
            }
            Spacer()
            HStack{
                VStack{
                    PartsCard(model: PartsCardModel.SAMPLE[0])
                    Spacer()
                }
                Spacer()
                VStack{
                    HStack{
                        Image(systemName: "globe")
                            .foregroundColor(Color.blue)
                        Text("マイコン")
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    PartsHeader()
}
