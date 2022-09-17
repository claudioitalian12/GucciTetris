//
//  GucciGame.swift
//  
//
//  Created by Claudio Cavalli on 14/09/22.
//

import BaseGucciTetris
import UIKit
import SpriteKit

// MARK: - GucciGame
/// The default game.
public class GucciGame: UIViewController, GucciViewController {
    /// the init viewModel.
    public var viewModel: GucciViewModel?
    /// the init scene.
    var scene: GucciScene?
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
        self.setupScene()
    }
    /// the setup interaction view.
    public func setupInteraction() {}
    /// the setup view style.
    public func style() {
        self.view.backgroundColor = GucciResources.Colors.Game().primaryColor
    }
    /// the setup view layout.
    public func layout() {}
    /// the setup view layout.
    public override func loadView() {
        super.loadView()
        self.view = SKView()
        self.view.bounds = UIScreen.main.bounds
    }
    /// setupScene.
    private func setupScene() {
        if let view = self.view as? SKView,
           let viewModelScene = viewModel?.getInstance(
            to: .gameScene
           ) as? GucciGrid,
           let grid = Grid(
            gridViewModel: viewModelScene
           ) {
            let scene = GucciScene(
                size: view.bounds.size
            )
            scene.grid = grid
            view.presentScene(scene)
            self.scene = scene
        }
    }
}
