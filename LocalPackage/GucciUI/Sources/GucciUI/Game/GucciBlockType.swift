//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 17/09/22.
//

import UIKit

// MARK: - BlockType
/// The BlockType.
public enum BlockType {
    /// whiteBlock.
    case whiteBlock
    /// blueBlock.
    case blueBlock(position: CGFloat, blockSize: CGFloat)
    /// blockValue.
    var blockValue: String {
        switch self {
        case .whiteBlock:
            return "10"
        case .blueBlock(var position, let blockSize):
            var value = 5
            while position > -79.0 {
                position = position - blockSize
                value += 5
            }
            return "\(Int(value))"
        }
    }
}
