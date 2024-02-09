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
    
    private let model : PartsImageModel
    
    init(model: PartsImageModel) {
        self.model = model
    }
    
    var body: some View {
        VStack{
            if let url = URL(string: self.model.images[0]){
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
    }
}

#Preview {
    PartsImage(model:PartsImageModel(images: ["pic16f18444", "pic16f18444-1","pic16f18444-2"]))
}
