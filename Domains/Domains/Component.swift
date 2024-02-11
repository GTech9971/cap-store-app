//
//  Component.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

///
///電子部品
public struct Component : Codable, Equatable {
    public let componentId : Int;
    public let name : String;
    public let modelName : String;
    public let description : String;
    public let category : Category;
    public let maker : Maker;
    public let images: [String];
    
    public init(componentId: Int, name: String, modelName: String, description: String, category: Category, maker: Maker, images: [String]) {
        self.componentId = componentId
        self.name = name
        self.modelName = modelName
        self.description = description
        self.category = category
        self.maker = maker
        self.images = images
    }
    
    public func toJson() -> String{
        let data = try! JSONEncoder().encode(self);
        return String(data: data, encoding: .utf8)!;
    }
    
    public static let SAMPLE : Component =  Component(componentId: 0,
                                                      name: "PIC16F18444", modelName: "PIC16F18444-I/P",
                                                      description: DESCRIPTION_SAMPLE,
                                                      category: Category(
                                                        id:0,
                                                        name: "マイコン",
                                                        image: "globe"
                                                      ),
                                                      maker: Maker(
                                                        id: 0,
                                                        name:"Microchip Technology",
                                                        image: nil
                                                      ),
                                                      images: [])

private static let DESCRIPTION_SAMPLE : String =
"""
ナノワットXLPテクノロジーによる超低消費電力
Cコンパイラに最適化されたアーキテクチャ
mTouchタッチセンサ入力

■主な仕様
・シリーズ：PIC16F
・電源電圧：1.8～5.5V
・コアサイズ：8bit
・命令長：14bit
・クロック：32MHz
・プログラムメモリ：4kW
・EEPROM：256B
・RAM：384B
・GPIO：16pin
・ADC：12Ch
・UART/USART：1Ch
・I2C：2Ch
・SPI：2Ch
・タイマ：5Ch
・オシレータ：内蔵/外付
・パッケージ：DIP18

・丸ピン18ピン(2227MC-18-03):P-00030
・平ピン18ピン(2227-18-03)(10個単位販売):P-00008
ICソケット関連一覧
SSOPパッケージ→I-08400
"""
}
