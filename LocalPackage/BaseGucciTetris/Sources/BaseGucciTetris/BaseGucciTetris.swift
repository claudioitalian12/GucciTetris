//
//  BaseGucciTetris.swift
//
//
//  Created by Claudio Cavalli on 14/09/22.
//

import Foundation
import UIKit
import SpriteKit

// MARK: - BaseGucciTetrisDelegate
/// The default app delegate.
public protocol BaseGucciTetrisDelegate: AnyObject {
    /// The root window.
    var window: UIWindow? { get set }
    /// The root app navigator.
    var appNavigator: AppNavigator? { get set }
}
// MARK: - AppNavigator
/// The navigation manager.
public protocol AppNavigator: AnyObject {
    /// The root navigator.
    var navigationController: UINavigationController { get set }
    /// The init.
    init(rootViewController: GucciViewController)
    /// push a destination.
    func push(to destination: GucciViewController)
    /// present a destination.
    func present(to destination: GucciViewController)
}
// MARK: - GucciViewController
/// The default view.
public protocol GucciViewController: UIViewController {
    /// The ViewModel.
    var viewModel: GucciViewModel? { get set }
    /// the setup view.
    func setup()
    /// the setup interaction view.
    func setupInteraction()
    /// the setup view style.
    func style()
    /// the setup view layout.
    func layout()
}
// MARK: - GucciViewModel
/// The default view model.
public protocol GucciViewModel: AnyObject {
    /// appNavigator.
    var appNavigator: AppNavigator? { get set }
    /// getInstance of GucciViewModel.
    func getInstance(to destination: Destination) -> GucciViewModel?
}
// MARK: - GameManager
/// The default game manager.
public protocol GucciGrid: GucciViewModel {
    /// rows.
    var rows: Int { get }
    /// cols.
    var cols: Int { get }
    /// blockSize.
    var blockSize: CGFloat { get }
    /// gridTexture.
    func gridTexture() -> SKTexture?
    /// gridPosition(row: Int, col: Int).
    func gridPosition(row: Int, col: Int) -> CGPoint
}
// MARK: - Destination
/// The destination case.
public enum Destination {
    /// The app hone.
    case home
    /// The app game.
    case game
    /// The game scene.
    case gameScene
}
