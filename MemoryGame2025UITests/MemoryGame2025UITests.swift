//
//  MemoryGame2025UITests.swift
//  MemoryGame2025UITests
//
//  Created by IMD 224 on 2025-01-08.
//

import XCTest

final class MemoryGame2025UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    @MainActor
    func testRowsCols() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["SettingsButton"].tap()
        
        var rowsColsLabel: String = app.staticTexts["NumberOfRowsAndCols"].label
        let stepper = app.steppers["RowsColsStepper"]
        var numRowsCols: Int = Int(rowsColsLabel)!
        
        let increment = stepper.buttons["RowsColsStepper-Increment"]
        let decrement = stepper.buttons["RowsColsStepper-Decrement"]
        
        XCTAssertEqual(stepper.label, "Rows and Columns")
        XCTAssertTrue(increment.exists, "Stepper Increment Does Not Exist.")
        XCTAssertTrue(decrement.exists, "Stepper Decrement Does Not Exist.")
        
        for _ in 1...10 {
            decrement.tap()
            rowsColsLabel = app.staticTexts["NumberOfRowsAndCols"].label
            XCTAssertEqual((numRowsCols == 2) ? 2 : numRowsCols - 1, Int(rowsColsLabel))
            numRowsCols = Int(rowsColsLabel)!
        }
        
        for _ in 1...10 {
            increment.tap()
            rowsColsLabel = app.staticTexts["NumberOfRowsAndCols"].label
            XCTAssertEqual((numRowsCols == 10) ? 10 : numRowsCols + 1 , Int(rowsColsLabel))
            numRowsCols = Int(rowsColsLabel)!
        }

    }
    
    @MainActor
    func testTiles() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["SettingsButton"].tap()
       
        var tilesLabel: String = app.staticTexts["NumberOfTiles"].label
        var numTiles: Int = Int(tilesLabel)!
        let stepper = app.steppers["TileStepper"]
        let increment = stepper.buttons["TileStepper-Increment"]
        let decrement = stepper.buttons["TileStepper-Decrement"]
        
        // Test Existance
        XCTAssertEqual(stepper.label, "Tiles")
        XCTAssertTrue(increment.exists, "Stepper Increment Does Not Exist.")
        XCTAssertTrue(decrement.exists, "Stepper Decrement Does Not Exist.")
        
        for _ in 1...10 {
            decrement.tap()
            tilesLabel = app.staticTexts["NumberOfTiles"].label
            XCTAssertEqual((numTiles == 2) ? 2 : numTiles - 1, Int(tilesLabel))
            numTiles = Int(tilesLabel)!
        }

        XCTAssertTrue(Int(tilesLabel)! >= 2, "Number of tiles subceeds lower bound (2)")
        
        for _ in 1...10 {
            increment.tap()
            tilesLabel = app.staticTexts["NumberOfTiles"].label
            XCTAssertEqual((numTiles == 10) ? 10 : numTiles + 1, Int(tilesLabel))
            numTiles = Int(tilesLabel)!
        }

        XCTAssertTrue(Int(tilesLabel)! <= 10, "Number of tiles exceeds upper bound (10)")
        
    }
    
    @MainActor
    func testImages() throws {
        let app = XCUIApplication()
        app.launch()
        
        let settings = app.buttons["SettingsButton"]
        settings.tap()
        
        let increment = app.buttons["RightArrow"]
        let decrement = app.buttons["LeftArrow"]
        
        // Test for existance
        XCTAssertTrue(increment.exists, "Image Picker Right Arrow does not exist")
        XCTAssertTrue(decrement.exists, "Image Picker Left Arrow does not exist")
        
        // Test for functionality
        XCTAssertTrue(increment.isHittable, "Image Picker Right Arrow is disabled")
        XCTAssertTrue(decrement.isHittable, "Image Picker Left Arrow is disabled")
        
//        let firstImage: String = app.images["Images"].label
//        var currImage: String = firstImage
        
//        for _ in 1...4 {
//            settings.tap()
//            XCTAssertTrue(currImage == app.images["GameImage"].label, "GameImage does not match selected Image in settings")
//            settings.tap()
//            increment.tap()
//            currImage = app.images["Images"].label
//            if currImage == firstImage {
//                break
//            }
//        }
//        
//        for _ in 1...4 {
//            settings.tap()
//            XCTAssertTrue(currImage == app.images["GameImage"].label, "GameImage does not match selected Image in settings")
//            settings.tap()
//            decrement.tap()
//            currImage = app.images["Images"].label
//            if currImage == firstImage {
//                break
//            }
//        }
    }
    
    @MainActor
    func testSaving() throws {
        let app = XCUIApplication()
        app.launch()
        
        let initGameImage = app.images["GameImage"].label
        
        let settings = app.buttons["SettingsButton"]
        settings.tap()
        
        let initRowsCols = Int(app.staticTexts["NumberOfRowsAndCols"].label)!
        let initTiles = Int(app.staticTexts["NumberOfTiles"].label)!
        let initImagePicked = app.images["Images"].label
        
        app.steppers["TileStepper"].buttons["TileStepper-Decrement"].tap()
        app.steppers["RowsColsStepper"].buttons["RowsColsStepper-Decrement"].tap()
        app.buttons["RightArrow"].tap()
        
        app.terminate()
        
        app.launch()
        
        XCTAssertTrue(initGameImage != app.images["GameImage"].label, "Game Image did not save.")
        settings.tap()
        XCTAssertTrue(initRowsCols != Int(app.staticTexts["NumberOfRowsAndCols"].label)!, "Rows and Columns did not save")
        XCTAssertTrue(initTiles != Int(app.staticTexts["NumberOfTiles"].label)!, "Tiles did not save")
        XCTAssertTrue(initImagePicked != app.images["Images"].label, "Image picker list did not save")
    }
    
    @MainActor
    func testGameView() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Game Clicks"].exists, "Clicks Text Does Not Exist")
        XCTAssertTrue(app.staticTexts["Game Score"].exists, "Score Text Does Not Exist")
        XCTAssertTrue(app.staticTexts["Treasures Left"].exists, "Remaining Treasures Text Does Not Exist")
    }
    
//    @MainActor
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    @MainActor
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
