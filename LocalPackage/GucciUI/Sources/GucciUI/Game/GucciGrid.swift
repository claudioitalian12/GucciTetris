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
class Grid: SKSpriteNode {
    /// gridViewModel.
    var gridViewModel: GucciGrid!
    /// blueBlockName.
    private let blueBlockName = "block"
    /// whiteBlockName.
    private let whiteBlockName = "whiteBlock"
    /// The init with gridModel.
    convenience init?(gridViewModel: GucciGrid) {
        guard let texture = gridViewModel.gridTexture() else {
            return nil
        }
        self.init(
            texture: texture,
            color: GucciResources.Colors.Game().clearBlockColor ?? .clear,
            size: texture.size()
        )
        self.gridViewModel = gridViewModel
        self.isUserInteractionEnabled = true
    }
    /// The GucciScene Grid touchesBegan.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { touch in
            didTapGrid(touch: touch)
        }
    }
    /// didTapGrid.
    func didTapGrid(touch: UITouch) {
        let position = touch.location(in: self)
        if positionIsNotFree(position: position) { return }
        addBlock(position: position)
    }
}
// MARK: - Grid
/// The GucciScene Grid.
private extension Grid {
    /// addBlock.
    func addBlock(position: CGPoint) {
        let block = GucciBlockFactory().createBlueBlock(
            size: CGSize(
                width: gridViewModel.blockSize,
                height: gridViewModel.blockSize
            ),
            name: blueBlockName
        )
        block.position = positionBlock(position: position)
        self.addChild(block)
        moveBlockActions(position: block.position)
    }
    /// moveBlockActions.
    func moveBlockActions(position: CGPoint) {
        let node = atPoint(position)
        if node != self {
            let action = SKAction.repeatForever(
                SKAction.sequence([
                    self.moveConditions(node: node),
                    self.moveAnimation(node: node)
                ])
            )
            node.run(action)
        }
    }
    /// moveConditions.
    func moveConditions(node: SKNode) -> SKAction {
        return SKAction.run { [weak self] in
            guard let self = self else {
                return
            }
            let closestNode = self.closestChild(point: node.position, maxDistance: 200.0)
            
            let childy = self.children.filter { nodes in
                return Int(node.position.y) == Int(nodes.position.y) && (self.closestChilds(point: node.position, maxDistance: 50) ?? []).count >= 2
            }
            if childy.count > 2 {
                node.removeAllActions()
                var nodePos = node.position.y
                while nodePos > -79.0 {
                    nodePos = nodePos - 40.0
                    
                    let fakeBlock = GucciBlockFactory().createWhiteBlock(
                        size: node.frame.size,
                        name: self.whiteBlockName
                    )
                    fakeBlock.name = self.whiteBlockName
                    fakeBlock.position = node.position
                    fakeBlock.position.y = nodePos
                    
                    if !self.positionIsNotFree(position: fakeBlock.position) {
                        self.addChild(fakeBlock)
                    }
                    self.showValue()
                }
            }
            
            let child = self.children.filter { nodes in
                return Int(node.position.x) == Int(nodes.position.x)
            }
            var posi: CGFloat
            if child.count > 4 {
                posi = (120.0 + CGFloat(child.count) * 40.0) - (CGFloat(child.count) * 40.0)
            } else if child.count == 4 {
                posi = (80.0 + CGFloat(child.count) * 40.0) - (CGFloat(child.count) * 40.0)
            } else if child.count == 3 {
                posi = (40.0 + CGFloat(child.count) * 40.0) - (CGFloat(child.count) * 40.0)
            } else {
                posi = -(CGFloat(child.count) * (80.0 + (CGFloat(child.count) * -40.0)))
            }
            if closestNode == nil || Int(node.position.y) < Int(posi) {
                node.removeAllActions()
                self.showValue()
            }
        }
    }
    /// moveAnimation.
    func moveAnimation(node: SKNode) -> SKAction {
        return SKAction.move(
            by: CGVector(
                dx: 0.0,
                dy: -(self.gridViewModel.blockSize)
            ),
            duration: 0.05
        )
    }
    /// positionIsNotFree.
    func positionIsNotFree(position: CGPoint) -> Bool {
        let nodeBlock = atPoint(position)
        return nodeBlock.name == blueBlockName || nodeBlock.name == whiteBlockName ? true:false
    }
    /// positionBlock.
    func positionBlock(position: CGPoint) -> CGPoint {
        let x = size.width / 2 + position.x
        let y = size.height / 2 - position.y
        let row = Int(floor(x / gridViewModel.blockSize))
        let col = Int(floor(y / gridViewModel.blockSize))
        
        return self.gridViewModel.gridPosition(row: col, col: row)
    }
    /// closestChild.
    func closestChild(point: CGPoint, maxDistance: CGFloat) -> SKNode? {
        return self
            .children
            .filter { $0.position.distancey(point: point) ?? (maxDistance + 1.0) <= maxDistance }
            .min { node, othernode in
                node.position.distancey(point: point) ?? (maxDistance + 1.0) < othernode.position.distancey(point: point) ?? (maxDistance + 1.0)
            }
    }
    /// closestChilds.
    func closestChilds(point: CGPoint, maxDistance: CGFloat) -> [SKNode]? {
        return self
            .children
            .filter { $0.position.distance(point: point) <= maxDistance }
            .filter { node in
                node.position.distancex(point: point) <= maxDistance && node.position.distancex(point: point) != 0.0
            }
    }
    /// showValue.
    func showValue() {
        let blueChildren = self.children.filter { node in
            node.name == blueBlockName
        }
        if blueChildren.count == 10 {
            self.isUserInteractionEnabled = false
            self.loadLabels()
        }
    }
    func loadLabels() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.children.forEach { node in
                switch node.name {
                case self.whiteBlockName:
                    node.blockValueLabel(
                        value: .whiteBlock
                    )
                case self.blueBlockName:
                    node.blockValueLabel(
                        value: .blueBlock(
                            position: node.position.y,
                            blockSize: self.gridViewModel.blockSize
                        )
                    )
                default:
                    return
                }
            }
            self.showResult()
        }
    }
    func showResult() {
        var result = 0
        self.children.forEach { node in
            switch node.name {
            case self.whiteBlockName:
                node.blockValueLabel(
                    value: .whiteBlock
                )
                result += 10
            case self.blueBlockName:
                node.blockValueLabel(
                    value: .blueBlock(
                        position: node.position.y,
                        blockSize: self.gridViewModel.blockSize
                    )
                )
                result += Int(BlockType.blueBlock(
                    position: node.position.y,
                    blockSize: self.gridViewModel.blockSize
                ).blockValue) ?? 0
            default:
                return
            }
        }
        scoreResultLabel(value: "score: \(result)")
    }
}
