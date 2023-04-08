//
//  Dinosaur.swift
//  
//
//  Created by Tiger Nixon on 4/7/23.
//

import UIKit

public struct Dinosaur {
    public let id: Int
    public let name: String
    public let meaning: String
    public let thumb: UIImage
}

extension Dinosaur: Identifiable {
    
}

extension Dinosaur: Hashable {
    public static func ==(lhs: Dinosaur, rhs: Dinosaur) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
