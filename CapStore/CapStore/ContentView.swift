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
            HStack{
                VStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                VStack{
                    List(){
                        ForEach(PartsCardModel.SAMPLE){ sample in
                            PartsCard(model: sample)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
