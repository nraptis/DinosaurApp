//
//  DinosaurDetails.swift
//  
//
//  Created by Tiger Nixon on 4/7/23.
//

import Foundation
import UIKit

public struct DinosaurDetails {
    
    public struct Paragraph {
        public let id: Int
        public let text: String
    }
    
    public let id: Int
    public let image: UIImage
    public let paragraphs: [Paragraph]
    public let period: Period
}

extension DinosaurDetails: Identifiable {
    
}

extension DinosaurDetails.Paragraph: Identifiable {
    
}

extension DinosaurDetails.Paragraph: Hashable {
    public static func ==(lhs: DinosaurDetails.Paragraph, rhs: DinosaurDetails.Paragraph) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
