//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 17/09/22.
//

import UIKit
import SpriteKit

// MARK: - extension CGPoint
/// The CGPoint distance.
extension CGPoint {
    /// distancex.
    func distancex(point: CGPoint) -> CGFloat {
        return point.x - self.x
    }
    /// distance.
    func distance(point: CGPoint) -> CGFloat {
        return CGFloat(
            hypotf(
                Float(point.x - self.x), Float(point.y - self.y)
            )
        )
    }
}
// MARK: - extension SKNode
/// The Bloc label.
extension SKNode {
    /// blocValueLabel.
    func blocValueLabel(value: BlocType) {
        let labelValue = SKLabelNode(text: value.blocValue)
        labelValue.fontColor = GucciResources.Colors.Game().fontBlocColor ?? .black
        addChild(labelValue)
        labelValue.position = CGPoint(x: 0, y: -10)
    }
    /// scoreResultLabel.
    func scoreResultLabel(value: String) {
        children.first { $0.name == "scoreResult" }?.removeFromParent()
        let labelValue = SKLabelNode(text: value)
        labelValue.fontColor = GucciResources.Colors.Game().fontBlocColor ?? .black
        addChild(labelValue)
        labelValue.position = CGPoint(x: 0, y: -150)
        labelValue.name = "scoreResult"
    }
}
