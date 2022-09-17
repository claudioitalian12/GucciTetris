//
//  GucciViewModel.swift
//
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris

// MARK: - public GucciViewModel
public extension GucciViewModel {
    /// getInstance.
    func getInstance(to destination: Destination) -> GucciViewModel? {
        switch destination {
        case .home:
            return HomeViewModel()
        case .game:
            return GameViewModel()
        case .gameScene:
            return GridViewModel(rows: 5, cols: 5, blockSize: 40.0)
        }
    }
}
