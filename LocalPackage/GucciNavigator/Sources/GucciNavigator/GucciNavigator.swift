//
//  GucciNavigator.swift
//
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris
import UIKit

// MARK: - class AppNavigator
/// Gucci app navigator.
public class GucciNavigator: AppNavigator {
    /// The root navigator.
    public var navigationController: UINavigationController
    /// The init navigator with destination.
    public required init(rootViewController: GucciViewController) {
        self.navigationController = UINavigationController(rootViewController: rootViewController)
    }
    /// push a destination.
    public func push(to destination: GucciViewController) {
        navigationController.pushViewController(destination, animated: true)
    }
    /// present a destination.
    public func present(to destination: GucciViewController) {
        navigationController.present(destination, animated: true)
    }
}
