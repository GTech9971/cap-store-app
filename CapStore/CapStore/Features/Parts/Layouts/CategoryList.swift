//
//  CategoryList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI
import Domains

struct CategoryList: View {
    @Binding var selection :UUID?;
    
    public let categories:[Domains.Category];
    
    var body: some View {
        List(selection : self.$selection){
            Section(header:Text("電子部品マスター")){
                ForEach(self.categories){ category in
                    CategoryLinkItem(model: category)
                }
            }
        }
    }
}

#Preview {
    CategoryList(selection: .constant(UUID()), categories:Domains.Category.SAMPLES)
}
