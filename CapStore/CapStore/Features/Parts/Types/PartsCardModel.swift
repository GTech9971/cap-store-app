//
//  PartsCardModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import Foundation

///電子部品カードモデル
public struct PartsCardModel : Identifiable {
    public let id = UUID()
    public let name : String;
    public let modelName : String;
    public let makerName : String;
    
    public init(name: String, modelName: String, makerName: String) {
        self.name = name
        self.modelName = modelName
        self.makerName = makerName
    }
    
    public static let SAMPLE : [PartsCardModel] = [
        PartsCardModel(name: "PIC マイコン PIC16F18444-I/P", modelName: "PIC16F18444-I/P", makerName: "MicrochipTechnology"),
        PartsCardModel(name: "実験用安定化電源 DP100", modelName: "DP100", makerName: " Guangzhou Atomic Electronic Technology Co., Ltd.(ALIENTEK)"),
        PartsCardModel(name: "ファストリカバリ・ダイオード 400V5A ER504", modelName: "ER504", makerName: " PANJIT INTERNATIONAL INC.(パンジット)"),
        PartsCardModel(name: "シリコンNチャネルIGBT(絶縁ゲートバイポーラトランジスタ) GT20J34", modelName: "GT20J341_S4X", makerName: " 株式会社東芝セミコンダクター社(TOSHIBA)")
        
    ]
}
