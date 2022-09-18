import XCTest
@testable import GucciViewModel
import BaseGucciTetris

final class GucciViewModelTests: XCTestCase {
    /// testInitGameViewModel.
    func testInitGameViewModel() throws {
        let viewModel = GameViewModel()
        XCTAssertNil(viewModel.appNavigator)
    }
    /// testInitHomeViewModel.
    func testInitHomeViewModel() throws {
        let viewModel = HomeViewModel()
        XCTAssertNil(viewModel.appNavigator)
    }
    /// testInitGridViewModel.
    func testInitGridViewModel() throws {
        let viewModel = GridViewModel(rows: 5, cols: 5, blocSize: 40.0)
        XCTAssertEqual(viewModel.rows, 5)
        XCTAssertEqual(viewModel.cols, 5)
        XCTAssertEqual(viewModel.blocSize, 40.0)
    }
    /// testHomeGucciViewModel.
    func testHomeGucciViewModel() throws {
        let game = GameViewModel()
        let gameInstance = game.getInstance(to: .game)
        let homeInstance = game.getInstance(to: .home)
        let sceneInstance = game.getInstance(to: .gameScene)
        XCTAssertTrue(gameInstance  is GameViewModel)
        XCTAssertTrue(homeInstance  is HomeViewModel)
        XCTAssertTrue(sceneInstance  is GridViewModel)
    }
    /// testGridTexture.
    func testGridTexture() throws {
        let viewModel = GridViewModel(rows: 5, cols: 5, blocSize: 40.0)
        XCTAssertNotNil(viewModel.gridTexture())
    }
    /// testGridPosition.
    func testGridPosition() throws {
        let viewModel = GridViewModel(rows: 5, cols: 5, blocSize: 40.0)
        XCTAssertEqual(CGPoint(x: 0.5, y: 0.5), viewModel.gridPosition(row: 2, col: 2))
    }
}
