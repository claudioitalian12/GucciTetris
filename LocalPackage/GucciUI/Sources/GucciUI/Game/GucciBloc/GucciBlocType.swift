//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 17/09/22.
//

import UIKit

// MARK: - BlocType
/// The BlocType.
public enum BlocType {
    /// whiteBloc.
    case whiteBloc
    /// blueBloc.
    case blueBloc(position: CGFloat, blocSize: CGFloat)
    /// blocValue.
    var blocValue: String {
        switch self {
        case .whiteBloc:
            return "10"
        case .blueBloc(var position, let blocSize):
            var value = 5
            while position > -79.0 {
                position = position - blocSize
                value += 5
            }
            return "\(Int(value))"
        }
    }
}
