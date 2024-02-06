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
    
    var body: some View {
        VStack{
            Image("pic16f18444")
                .resizable()
                .frame(width:WIDTH, height: HEIGHT)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    PartsImage()
}
