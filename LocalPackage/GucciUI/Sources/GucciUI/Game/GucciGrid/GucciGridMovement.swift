//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 18/09/22.
//

import UIKit
import SpriteKit

// MARK: - Grid
/// The GucciScene Grid.
extension Grid {
    /// didTapGrid.
    func didTapGrid(touch: UITouch) {
        let position = touch.location(in: self)
        if positionIsNotFree(position: position) { return }
        addBloc(position: position)
    }
    /// addBloc.
    func addBloc(position: CGPoint) {
        let bloc = GucciBlocFactory().createBlueBloc(
            size: CGSize(
                width: gridViewModel.blocSize,
                height: gridViewModel.blocSize
            ),
            name: BlocName.blueBloc.rawValue
        )
        bloc.position = positionBloc(position: position)
        self.addChild(bloc)
        moveBlocActions(position: bloc.position)
    }
    /// moveBlocActions.
    func moveBlocActions(position: CGPoint) {
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
        SKAction.run { [weak self] in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.checkWhiteBloc(node: node)
                self.checkBlueBloc(node: node)
            }
        }
    }
    /// checkWhiteBloc.
    func checkWhiteBloc(node: SKNode) {
        let closestChilds = self.children.filter {
            Int(node.position.y) == Int($0.position.y) &&
            (self.closestChilds(
                point: node.position,
                maxDistance: self.gridViewModel.blocSize
            ) ?? []).count >= 2
        }
        if closestChilds.count > 2 {
            addWhiteBlocs(node: node)
        }
    }
    /// addWhiteBlocs.
    func addWhiteBlocs(node: SKNode) {
        node.removeAllActions()
        var whiteNodePosition = node.position.y
        while whiteNodePosition > self.gridViewModel.gridMinY() {
            whiteNodePosition = whiteNodePosition - self.gridViewModel.blocSize
            
            let whiteBloc = GucciBlocFactory().createWhiteBloc(
                size: node.frame.size,
                name: BlocName.whiteBloc.rawValue
            )
            whiteBloc.name = BlocName.whiteBloc.rawValue
            whiteBloc.position = node.position
            whiteBloc.position.y = whiteNodePosition
            
            if !self.positionIsNotFree(position: whiteBloc.position) {
                self.addChild(whiteBloc)
            }
        }
    }
    /// checkBlueBloc.
    func checkBlueBloc(node: SKNode) {
        let child = self.children.filter {
            Int(node.position.x) == Int($0.position.x)
        }
        let finalPosition: CGFloat
        if child.count > gridViewModel.gridPositiveRow() {
            finalPosition = CGFloat(
                child.count - gridViewModel.gridPositiveRow()
            ) * self.gridViewModel.blocSize
        } else {
            finalPosition = -((self.gridViewModel.blocSize)/CGFloat(child.count))
        }
        if Int(node.position.y) < Int(finalPosition) {
            self.numberOfBlocs()
            node.removeAllActions()
        }
    }
    /// moveAnimation.
    func moveAnimation(node: SKNode) -> SKAction {
        return SKAction.move(
            by: CGVector(
                dx: 0.0,
                dy: -(self.gridViewModel.blocSize)
            ),
            duration: 0.05
        )
    }
    /// positionIsNotFree.
    func positionIsNotFree(position: CGPoint) -> Bool {
        let nodeBloc = atPoint(position)
        return nodeBloc.name == BlocName.blueBloc.rawValue || nodeBloc.name == BlocName.whiteBloc.rawValue ? true:false
    }
    /// positionBloc.
    func positionBloc(position: CGPoint) -> CGPoint {
        let x = size.width / 2 + position.x
        let y = size.height / 2 - position.y
        let row = Int(floor(x / gridViewModel.blocSize))
        let col = Int(floor(y / gridViewModel.blocSize))
        
        return self.gridViewModel.gridPosition(row: col, col: row)
    }
    /// closestChilds.
    func closestChilds(point: CGPoint, maxDistance: CGFloat) -> [SKNode]? {
        self.children
            .filter {
                $0.position.distance(point: point) <= maxDistance
            }
            .filter {
                $0.position.distancex(point: point) <= maxDistance && $0.position.distancex(point: point) != 0.0
            }
    }
    /// showValue.
    func numberOfBlocs() {
        let blueChildren = self.children.filter {
            $0.name == BlocName.blueBloc.rawValue
        }
        if blueChildren.count == 10 {
            self.isUserInteractionEnabled = false
            self.scoreLabels()
        }
    }
}
