//
//  Maker.swift
//  Domains
//
//  Created by George Dambara on 2024/01/24.
//

import Foundation

///メーカー
public struct Maker : Codable, Equatable, Identifiable, Hashable{
    public var id : UUID = UUID();
    public let makerId: Int;
    public let name : String;
    public let image : String?;
    
    public init(makerId: Int, name: String, image: String?) {
        self.makerId = makerId
        self.name = name
        self.image = image
    }
    
    public func toJson() -> String{
        let data = try! JSONEncoder().encode(self);
        return String(data: data, encoding: .utf8)!;
    }
    
    public enum CodingKeys : String, CodingKey{
        case makerId
        case name
        case image
    }
    
    public static let SAMPLES : [Maker] = [
        Maker(makerId:0, name: "Microchip Technology", image: nil)
    ]
}
