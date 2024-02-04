//
//  PartCard.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

struct PartsCard: View {
    @State var isSelected : Bool;
    private let model : PartsCardModel
    
    public init(model: PartsCardModel) {
        self.model = model
        self.isSelected = false
    }
    
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                Text(model.name)
                    .font(.headline);
                Text(model.modelName)
                    .font(.subheadline)
                Text(model.makerName)
                    .font(.caption)
                    .fontWeight(.light)
            }
            .padding(.vertical, 3.0)
            .padding(.horizontal, 3.0)
        }
        .padding()
        .cornerRadius(8.0)
        .clipped()
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        //.contentShapeでタップ領域を広げる
        .contentShape(RoundedRectangle(cornerRadius: 20))
        //タップ時に背景色を変更
        .background(isSelected ?  Color.accentColor : Color.clear)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    PartsCard(model: PartsCardModel(
            name: "PICマイコン PIC16F18444-I/P",
            modelName: "PIC16F18444-I/P",
            makerName: "MicrochipTechnology"
        )
    )
}
