//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 17/09/22.
//

import UIKit

// MARK: - GucciBlocFactory
/// The GucciBlocFactory.
public struct GucciBlocFactory {
    /// The createBlueBloc.
    func createBlueBloc(size: CGSize, name: String) -> Bloc {
        Bloc(
            texture: nil,
            color: GucciResources.Colors.Game().normalBlocColor ?? .blue,
            size: size,
            name: name
        )
    }
    /// The createWhiteBloc.
    func createWhiteBloc(size: CGSize, name: String) -> Bloc {
        Bloc(
            texture: nil,
            color: GucciResources.Colors.Game().clearBlocColor ?? .clear,
            size: size,
            name: name
        )
    }
}
