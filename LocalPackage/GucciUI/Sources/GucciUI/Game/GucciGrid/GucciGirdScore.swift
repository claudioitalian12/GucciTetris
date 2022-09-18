//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 18/09/22.
//

import Foundation

// MARK: - Grid
/// The GucciScene Grid.
extension Grid {
    /// scoreLabels.
    func scoreLabels() {
        var scoreResult = 0
        self.children.forEach { node in
            switch node.name {
            case BlocName.whiteBloc.rawValue:
                node.blocValueLabel(
                    value: .whiteBloc
                )
                scoreResult += 10
            case BlocName.blueBloc.rawValue:
                node.blocValueLabel(
                    value: .blueBloc(
                        position: node.position.y,
                        blocSize: gridViewModel.blocSize,
                        minY: gridViewModel.gridMinY()
                    )
                )
                scoreResult += Int(
                    BlocType.blueBloc(
                        position: node.position.y,
                        blocSize: gridViewModel.blocSize,
                        minY: gridViewModel.gridMinY()
                    ).blocValue
                ) ?? 0
            default:
                return
            }
        }
        scoreResultLabel(value: "score: \(scoreResult)")
    }
}
