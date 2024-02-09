//
//  PartsImageModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/09.
//

import Foundation

struct PartsImageModel{
    public let images : [String];
    
    
    init(images: [String]) {
        self.images = images
    }
    

    public static let SAMPLE : PartsImageModel = PartsImageModel(images: ["pic16f18444", "pic16f18444-1", "pic16f18444-2"])
}
