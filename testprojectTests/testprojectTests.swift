//
//  testprojectTests.swift
//  testprojectTests
//
//  Created by bnkwsr4 on 05.02.2022.
//

import XCTest
@testable import testproject

class testprojectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var cart : [Dishes] = [
            Dishes(dishId: "123", category: "Foods", nameDish: "Test", price: "1000", icon: "", version: "1.0", count: 2),
            Dishes(dishId: "124", category: "Foods", nameDish: "Test1", price: "2000", icon: "", version: "1.0", count: 1),
            Dishes(dishId: "125", category: "Foods", nameDish: "Test2", price: "3000", icon: "", version: "1.0", count: 1),
            Dishes(dishId: "126", category: "Foods", nameDish: "Test3", price: "4000", icon: "", version: "1.0", count: 1)
        ]
        var fullPrice = 0
        
        for x in cart {
            fullPrice = fullPrice + Int(x.price ?? "")! * (x.count ?? 0)
        }
        
        XCTAssertEqual(fullPrice, 11000)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct Dishes : Codable {
    let dishId : String
    var category : String
    let nameDish : String
    let price : String
    let icon : String
    let version : String
    var count : Int? = 0
}
