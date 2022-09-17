//
//  GucciResources.swift
//
//
//  Created by Claudio Cavalli on 14/09/22.
//

import UIKit

// MARK: - GucciResources
/// The GucciResources with colors,ui,font etc.
enum GucciResources {
    public enum Colors {}
    public enum UI {}
}
// MARK: - GucciResources Colors
/// The default colors.
extension GucciResources.Colors {
    /// The home colors.
    public struct Home {
        public init() {}
        public let primaryColor = UIColor(named: "white", in: Bundle.module, compatibleWith: nil)
    }
    /// The game colors.
    public struct Game {
        public init() {}
        public let primaryColor = UIColor(named: "white", in: Bundle.module, compatibleWith: nil)
        public let normalBlockColor = UIColor(named: "blue", in: Bundle.module, compatibleWith: nil)
        public let clearBlockColor = UIColor(named: "clear", in: Bundle.module, compatibleWith: nil)
        public let fontBlockColor = UIColor(named: "black", in: Bundle.module, compatibleWith: nil)
    }
}
// MARK: - GucciResources UI
/// The default ui resources.
extension GucciResources.UI {
    /// The home resources.
    public struct Home {
        public init() {}
        public let logo = UIImage(named: "tetris", in: Bundle.module, compatibleWith: nil)
    }
}
