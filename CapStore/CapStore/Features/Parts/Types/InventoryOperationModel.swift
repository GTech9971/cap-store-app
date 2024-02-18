//
//  InventoryOperationModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/18.
//

import Foundation


/// 在庫操作に関するモデル
struct InventoryOperationModel : Identifiable{
    public let id = UUID()
    public let name : String
    public let image : String?
    
    public init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
    
    public static let SAMPLES : [InventoryOperationModel] = [
        InventoryOperationModel(name: "発注", image: "cart"),
        InventoryOperationModel(name: "入荷", image: "tray.and.arrow.down"),
        InventoryOperationModel(name: "引当", image: "pin"),
        InventoryOperationModel(name: "出荷", image: "truck.box")
    ]
}
