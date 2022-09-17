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
    /// distancey.
    func distancey(point: CGPoint) -> CGFloat? {
        if point.x == self.x {
            return CGFloat(
                Float(point.y - self.y)
            )
        } else {
            return nil
        }
    }
}
// MARK: - extension SKNode
/// The Block label.
extension SKNode {
    func blockValueLabel(value: BlockType) {
        let labelValue = SKLabelNode(text: value.blockValue)
        labelValue.fontColor = GucciResources.Colors.Game().fontBlockColor ?? .black
        addChild(labelValue)
        labelValue.position = CGPoint(x: 0, y: -10)
        labelValue.name = "blockValue"
    }
    func scoreResultLabel(value: String) {
        let labelValue = SKLabelNode(text: value)
        labelValue.fontColor = GucciResources.Colors.Game().fontBlockColor ?? .black
        addChild(labelValue)
        labelValue.position = CGPoint(x: 0, y: -150)
    }
}
