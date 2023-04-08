//
//  PeriodDetails.swift
//  
//
//  Created by Tiger Nixon on 4/7/23.
//

import Foundation
import UIKit

public struct PeriodDetails {
    
    public struct Paragraph {
        public let id: Int
        public let text: String
    }
    
    public let id: Int
    public let image: UIImage
    public let paragraphs: [Paragraph]
    public let dinosaurs: [Dinosaur]
}

extension PeriodDetails: Identifiable {
    
}

extension PeriodDetails.Paragraph: Identifiable {
    
}

extension PeriodDetails.Paragraph: Hashable {
    public static func ==(lhs: PeriodDetails.Paragraph, rhs: PeriodDetails.Paragraph) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
