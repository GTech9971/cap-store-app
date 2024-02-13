//
//  CategoryList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI
import Domains

struct CategoryList: View {
    @Binding var selection :Domains.Category?;

    public let categories:[Domains.Category];
    
    var body: some View {
        List(selection : self.$selection){
            ForEach(self.categories){ category in
                NavigationLink(value : category.id){
                    CategoryLinkItem(model: category)
                }
            }
        }
    }
}

#Preview {
    CategoryList(selection: .constant(Domains.Category(categoryId: 0, name: "", image: nil)), categories:Domains.Category.SAMPLES)
}
