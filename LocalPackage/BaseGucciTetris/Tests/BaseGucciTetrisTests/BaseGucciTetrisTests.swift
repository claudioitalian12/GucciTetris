import XCTest
@testable import BaseGucciTetris

final class BaseGucciTetrisTests: XCTestCase {
    /// testInitDestinationHome.
    func testInitDestinationHome() throws {
        let home = Destination.home
        XCTAssertEqual(home, .home)
    }
    /// testInitDestinationGame.
    func testInitDestinationGame() throws {
        let game = Destination.game
        XCTAssertEqual(game, .game)
    }
    /// testInitDestinationScene.
    func testInitDestinationScene() throws {
        let gameScene = Destination.gameScene
        XCTAssertEqual(gameScene, .gameScene)
    }
}
