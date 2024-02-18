//
//  InventoryList.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/18.
//

import SwiftUI

struct InventoryOperationList: View {
    @Binding var selection :UUID?;
    
    var body: some View {
        List(selection : self.$selection){
            Section(header:Text("電子部品在庫操作")){
                ForEach(InventoryOperationModel.SAMPLES){ data in
                    InventoryOperationItem(model: data)
                }
            }
        }
    }
}

#Preview {
    InventoryOperationList(selection: .constant(UUID()))
}
