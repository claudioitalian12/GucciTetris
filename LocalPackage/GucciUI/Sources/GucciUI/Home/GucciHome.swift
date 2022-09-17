//
//  GucciHome.swift
//
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris
import UIKit

// MARK: - GucciHome
/// The default view.
public class GucciHome: UIViewController, GucciViewController {
    /// The ViewModel.
    public var viewModel: GucciViewModel?
    /// The logo.
    private let imageViewLogo = UIImageView()
    /// The startButton.
    private let startButton = UIButton()
    /// the init view.
    public init(viewModel: GucciViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.setup()
        self.setupInteraction()
        self.style()
        self.layout()
    }
    /// the required init view.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// the setup view.
    public func setup() {
        self.view.addSubview(imageViewLogo)
        self.view.addSubview(startButton)
    }
    /// the setup interaction view.
    public func setupInteraction() {
        self.startButton.addTarget(
            self, action: #selector(startAction),
            for: .touchUpInside
        )
    }
    /// the setup view style.
    public func style() {
        self.view.backgroundColor = GucciResources.Colors.Home().primaryColor
        self.imageViewLogo.image = GucciResources.UI.Home().logo
        self.imageViewLogo.contentMode = .scaleAspectFit
        self.startButton.setTitle("start", for: .normal)
        self.startButton.backgroundColor = .black
        self.startButton.layer.cornerRadius = 20.0
    }
    /// the setup view layout.
    public func layout() {
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageViewLogo.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 0.0
            ),
            imageViewLogo.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: 20.0
            ),
            imageViewLogo.rightAnchor.constraint(
                equalTo: view.rightAnchor,
                constant: -20.0
            ),
            imageViewLogo.heightAnchor.constraint(
                equalToConstant: 200.0
            ),
            startButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20.0
            ),
            startButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor,
                constant: 0.0
            ),
            startButton.widthAnchor.constraint(
                equalToConstant: 300.0
            ),
            startButton.heightAnchor.constraint(
                equalToConstant: 50.0
            )
        ])
    }
}
// MARK: - @objc extension GucciHome
@objc private extension GucciHome {
    func startAction() {
        self.viewModel?.appNavigator?.push(
            to: GucciGame(
                viewModel: self.viewModel?.getInstance(
                    to: .game
                ) ?? nil
            )
        )
    }
}
// MARK: - Preview GucciHome
/// The live preview.
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct GucciHome_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            // Return GucciHome to preview
            let vc = GucciHome(viewModel: nil)
            return vc
        }
    }
}
#endif
