import XCTest
@testable import GucciUI

// MARK: - GucciUITests
final class GucciUITests: XCTestCase {
    /// testLoadHomePrimaryColor.
    func testLoadHomePrimaryColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Home().primaryColor)
    }
    /// testLoadHomeLogo.
    func testLoadHomeLogo() throws {
        XCTAssertNotNil(GucciResources.UI.Home().logo)
    }
    /// testLoadGamePrimaryColor.
    func testLoadGamePrimaryColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().primaryColor)
    }
    /// testLoadGameNormalBlockColor.
    func testLoadGameNormalBlockColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().normalBlockColor)
    }
    /// testLoadGameClearBlockColor.
    func testLoadGameClearBlockColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().clearBlockColor)
    }
    /// testLoadGameFontBlockColor.
    func testLoadGameFontBlockColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().fontBlockColor)
    }
    /// testLoadBlockTypeWhiteValue.
    func testLoadBlockTypeWhiteValue() throws {
        let blockType = BlockType.whiteBlock
        XCTAssertEqual("10", blockType.blockValue)
    }
    /// testLoadBlockTypeBlueValue.
    func testLoadBlockTypeBlueValue() throws {
        let blockType = BlockType.blueBlock(position: -80.0, blockSize: 0.0)
        XCTAssertEqual("5", blockType.blockValue)
    }
    /// testBlockName.
    func testBlockName() throws {
        let block = Block(texture: nil, color: .clear, size: .zero, name: "block")
        XCTAssertEqual(block.name, "block")
    }
    /// testGucciHome.
    func testGucciHome() throws {
        let vc = GucciHome(viewModel: nil)
        XCTAssertNil(vc.viewModel)
    }
    /// testGucciGame.
    func testGucciGame() throws {
        let vc = GucciGame(viewModel: nil)
        XCTAssertNil(vc.viewModel)
    }
    /// testGucciGrid.
    func testGucciGrid() throws {
        let grid = Grid(texture: nil, color: .clear, size: .zero)
        XCTAssertNil(grid.gridViewModel)
    }
    /// testGucciScene.
    func testGucciScene() throws {
        let scene = GucciScene(size: .zero)
        XCTAssertNil(scene.grid)
    }
    /// testGucciBlueBlockFactory.
    func testGucciBlueBlockFactory() {
        let block = GucciBlockFactory().createBlueBlock(size: .zero, name: "block")
        XCTAssertEqual(block.name, "block")
        XCTAssertEqual(block.size, .zero)
    }
    /// testGucciWhiteBlockFactory.
    func testGucciWhiteBlockFactory() {
        let block = GucciBlockFactory().createWhiteBlock(size: .zero, name: "white")
        XCTAssertEqual(block.name, "white")
        XCTAssertEqual(block.size, .zero)
    }
}
