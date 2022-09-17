//
//  GucciUI.swift
//  
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris
import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
// MARK: - UIViewControllerPreview
/// The default preview.
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    /// generic viewController.
    let viewController: ViewController
    /// init.
    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    /// makeUIViewController.
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    /// updateUIViewController.
    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}
#endif
