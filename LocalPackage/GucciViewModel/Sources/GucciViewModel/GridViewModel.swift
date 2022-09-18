//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 15/09/22.
//

import BaseGucciTetris
import UIKit
import SpriteKit

// MARK: - GridViewModel
/// GridViewModel.
class GridViewModel: GucciGrid {
    /// appNavigator.
    public var appNavigator: AppNavigator?
    /// rows.
    public var rows: Int
    /// cols.
    public var cols: Int
    /// blocSize.
    public var blocSize: CGFloat
    /// init(rows: Int, cols: Int, blocSize: CGFloat).
    init(rows: Int, cols: Int, blocSize: CGFloat) {
        self.rows = rows
        self.cols = cols
        self.blocSize = blocSize
    }
    /// gridTexture for create the matrix.
    public func gridTexture() -> SKTexture? {
        let bezierPath = UIBezierPath()
        let offset: CGFloat = 0.5
        let size = CGSize(
            width: CGFloat(
                cols
            ) * blocSize + 1.0,
            height: CGFloat(
                rows
            ) * blocSize + 1.0
        )
        UIGraphicsBeginImageContext(size)
        
        for i in 0...cols {
            let x = CGFloat(i) * blocSize + offset
            bezierPath.move(to: CGPoint(x: x, y: 0))
            bezierPath.addLine(to: CGPoint(x: x, y: size.height))
        }
        for i in 0...rows {
            let y = CGFloat(i) * blocSize + offset
            bezierPath.move(to: CGPoint(x: 0, y: y))
            bezierPath.addLine(to: CGPoint(x: size.width, y: y))
        }
        SKColor.black.setStroke()
        bezierPath.stroke()
        UIGraphicsGetCurrentContext()?.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image!)
    }
    /// gridPosition(row:Int, col:Int).
    public func gridPosition(row: Int, col: Int) -> CGPoint {
        let offset = self.blocSize / 2.0 + 0.5
        let x = CGFloat(col) * self.blocSize - (self.blocSize * CGFloat(self.cols)) / 2.0 + offset
        let y = CGFloat(self.rows - row - 1) * self.blocSize - (self.blocSize * CGFloat(self.rows)) / 2.0 + offset
        return CGPoint(x: x, y: y)
    }
}
