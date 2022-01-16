//
//  ZipCodeFinderTests.swift
//  ZipCodeFinderTests
//
//  Created by Del Edwards on 1/15/22.
//

import XCTest

import RxSwift
import RxTest
import RxCocoa

class ZipCodeFinderTests: XCTestCase {
    
    private let container = Container()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        container.autoregister(ZipCodeService.self) { _ in
           MockZipCodeServiceImpl()
       }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual("four", "four")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
