//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 17/09/22.
//

import UIKit

// MARK: - GucciBlockFactory
/// The GucciBlockFactory.
public struct GucciBlockFactory {
    /// The createBlueBlock.
    func createBlueBlock(size: CGSize, name: String) -> Block {
        Block(
            texture: nil,
            color: GucciResources.Colors.Game().normalBlockColor ?? .blue,
            size: size,
            name: name
        )
    }
    /// The createWhiteBlock.
    func createWhiteBlock(size: CGSize, name: String) -> Block {
        Block(
            texture: nil,
            color: GucciResources.Colors.Game().clearBlockColor ?? .clear,
            size: size,
            name: name
        )
    }
}
