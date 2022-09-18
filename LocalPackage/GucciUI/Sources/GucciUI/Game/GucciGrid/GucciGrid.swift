//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 15/09/22.
//

import BaseGucciTetris
import UIKit
import SpriteKit

// MARK: - Grid
/// The GucciScene Grid.
public class Grid: SKSpriteNode {
    /// gridViewModel.
    var gridViewModel: GucciGrid!
    /// The init with gridModel.
    convenience init?(gridViewModel: GucciGrid) {
        guard let texture = gridViewModel.gridTexture() else {
            return nil
        }
        self.init(
            texture: texture,
            color: GucciResources.Colors.Game().clearBlocColor ?? .clear,
            size: texture.size()
        )
        self.gridViewModel = gridViewModel
        self.isUserInteractionEnabled = true
    }
    /// The GucciScene Grid touchesBegan.
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { touch in
            didTapGrid(touch: touch)
        }
    }
}
