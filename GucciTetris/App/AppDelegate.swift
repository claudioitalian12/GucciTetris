//
//  AppDelegate.swift
//  GucciTetris
//
//  Created by Claudio Cavalli on 13/09/22.
//

import UIKit
import BaseGucciTetris
import GucciNavigator
import GucciUI
import GucciViewModel

// MARK: - @main class AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate, BaseGucciTetrisDelegate {
    /// The root window.
    var window: UIWindow?
    /// The root app navigator.
    var appNavigator: AppNavigator?
    /// application launchOptions.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initialDestination()
    }
}
// MARK: - private extension AppDelegate
extension AppDelegate {
    /// init and set the destination.
    func initialDestination() -> Bool {
        let homeViewModel = HomeViewModel()
        let homeView = GucciHome(
            viewModel: homeViewModel
        )
        self.appNavigator = GucciNavigator(
            rootViewController: homeView
        )
        homeViewModel.appNavigator = self.appNavigator
        self.window = UIWindow()
        self.window?.rootViewController = self.appNavigator?.navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
