//
//  PartsImage.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsImage: View {
    
    let WIDTH : CGFloat = 150;
    let HEIGHT : CGFloat = 150;
    
    private let model : PartsImageModel?
    
    init(model: PartsImageModel?) {
        self.model = model
    }
    
    var body: some View {
        if let model = self.model{
            VStack{
                if let url = URL(string: model.images.first!){
                    AsyncImage(url: url){ image in
                        image
                            .image?
                            .resizable()
                            .frame(width:WIDTH, height: HEIGHT)
                    }
                }else{
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(minWidth: WIDTH * 1.1, minHeight: HEIGHT * 1.1)
        }else{
            Text("No Image")
                .font(Font.system(size: 24).bold())
                .foregroundColor(Color.white)
                .frame(minWidth: WIDTH * 1.1, minHeight: HEIGHT * 1.1)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        
    }
}

#Preview {
//    PartsImage(model:PartsImageModel(images: ["pic16f18444", "pic16f18444-1","pic16f18444-2"])!)
    PartsImage(model: nil)
}

