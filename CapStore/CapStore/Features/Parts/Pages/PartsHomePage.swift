//
//  PartsHome.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import SwiftUI

private let links : [String] = [
    "PIC",
    "Register",
    "LED",
    "Sensor",
    "Battery"
]

struct PartsHomePage: View {
    var body: some View {
        NavigationSplitView{
            List(CategoryLinkModel.SAMPLES){ sample in
                NavigationLink(value: sample.id){
                    CategoryLinkItem(model: sample)
                }
            }
        } detail: {
            Text("detail")
        }
        .navigationTitle("マスター")
    }
}

#Preview {
    PartsHomePage()
}
