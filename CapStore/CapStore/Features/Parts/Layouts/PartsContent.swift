//
//  PartsContent.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import SwiftUI

struct PartsContent: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(systemName: "globe")
                Text("PIC16F18444")
                    .fontWeight(.light)
            }
            .padding(.bottom)
            Text(sample)
        }
    }
}

#Preview {
    PartsContent()
}


private let sample : String =
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
