//
//  GucciScene.swift
//  
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris
import UIKit
import SpriteKit

// MARK: - GucciScene
/// The GucciScene that implement the Grid.
class GucciScene: SKScene {
    /// grid.
    var grid: Grid?
    /// didMove(to view: SKView).
    override func didMove(to view: SKView) {
        self.backgroundColor = GucciResources.Colors.Game().primaryColor ?? .white
        guard let grid = grid else {
            return
        }
        grid.position = CGPoint(x:frame.midX, y:frame.midY)
        addChild(grid)
    }
}
