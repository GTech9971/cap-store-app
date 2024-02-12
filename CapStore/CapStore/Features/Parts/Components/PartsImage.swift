//
//  PartsImage.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsImage: View {
    
    var minWidth : CGFloat = 150;
    var minHeight : CGFloat = 150;
    
    private let model : PartsImageModel?
    
    init(model: PartsImageModel?, minWidth : CGFloat = 150, minHeight : CGFloat = 150) {
        self.model = model
        self.minWidth = minWidth
        self.minHeight = minHeight
    }
    
    var body: some View {
        if let model = self.model{
            VStack{
                if let url = URL(string: model.images.first!){
                    AsyncImage(url: url){ image in
                        image
                            .image?
                            .resizable()
                            .frame(width:self.minWidth, height: self.minHeight)
                    }
                }else{
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(minWidth: self.minWidth * 1.1, minHeight: self.minHeight * 1.1)
        }else{
            Text("No Image")
                .font(Font.system(size: 24).bold())
                .foregroundColor(Color.white)
                .frame(minWidth: self.minWidth * 1.1, minHeight: self.minHeight * 1.1)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        
    }
}

#Preview {
//    PartsImage(model:PartsImageModel(images: ["pic16f18444", "pic16f18444-1","pic16f18444-2"])!)
    PartsImage(model: nil)
}

