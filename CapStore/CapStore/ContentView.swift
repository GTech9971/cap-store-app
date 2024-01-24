//
//  ContentView.swift
//  CapStore
//
//  Created by George Dambara on 2024/01/24.
//

import SwiftUI
import Domains

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {
                let maker = Maker(name: "test")
                print(maker.name)
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
