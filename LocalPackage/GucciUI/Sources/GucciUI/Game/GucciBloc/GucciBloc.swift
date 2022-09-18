//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 15/09/22.
//

import SpriteKit

// MARK: - Bloc
/// The Bloc.
public class Bloc: SKSpriteNode {
    convenience init(texture: SKTexture?, color: UIColor, size: CGSize, name: String?) {
        self.init(texture: texture, color: color, size: size)
        self.name = name
    }
}
