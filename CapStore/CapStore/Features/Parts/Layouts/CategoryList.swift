//
//  CategoryList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct CategoryList: View {
    
    @State private var selection : UUID?
    
    var body: some View {
        List(selection : $selection){
            ForEach(CategoryLinkModel.SAMPLES){ category in
                NavigationLink(value : category.id){
                    CategoryLinkItem(model: category)
                }
            }
        }
    }
}

#Preview {
    CategoryList()
}
