import XCTest
@testable import TwilioAccessToken

class TwilioAccessTokenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(TwilioAccessToken().text, "Hello, World!")
    }


    static var allTests : [(String, (TwilioAccessTokenTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
