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
    /// testLoadGameNormalBlocColor.
    func testLoadGameNormalBlocColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().normalBlocColor)
    }
    /// testLoadGameClearBlocColor.
    func testLoadGameClearBlocColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().clearBlocColor)
    }
    /// testLoadGameFontBlocColor.
    func testLoadGameFontBlocColor() throws {
        XCTAssertNotNil(GucciResources.Colors.Game().fontBlocColor)
    }
    /// testLoadBlocTypeWhiteValue.
    func testLoadBlocTypeWhiteValue() throws {
        let blocType = BlocType.whiteBloc
        XCTAssertEqual("10", blocType.blocValue)
    }
    /// testLoadBlocTypeBlueValue.
    func testLoadBlocTypeBlueValue() throws {
        let blocType = BlocType.blueBloc(position: -80.0, blocSize: 0.0, minY: -79.0)
        XCTAssertEqual("5", blocType.blocValue)
    }
    /// testBlocName.
    func testBlocName() throws {
        let bloc = Bloc(texture: nil, color: .clear, size: .zero, name: "bloc")
        XCTAssertEqual(bloc.name, "bloc")
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
    /// testGucciBlueBlocFactory.
    func testGucciBlueBlocFactory() {
        let bloc = GucciBlocFactory().createBlueBloc(size: .zero, name: "bloc")
        XCTAssertEqual(bloc.name, "bloc")
        XCTAssertEqual(bloc.size, .zero)
    }
    /// testGucciWhiteBlocFactory.
    func testGucciWhiteBlocFactory() {
        let bloc = GucciBlocFactory().createWhiteBloc(size: .zero, name: "white")
        XCTAssertEqual(bloc.name, "white")
        XCTAssertEqual(bloc.size, .zero)
    }
}
