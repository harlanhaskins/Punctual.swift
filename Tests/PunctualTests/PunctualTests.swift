import XCTest
@testable import Punctual

class PunctualTests: XCTestCase {
    let referenceDate = Date(timeIntervalSince1970: 0)
    func testDateProperties() {
        XCTAssertEqual(referenceDate.day, 31)
        XCTAssertEqual(referenceDate.month, 12)
        XCTAssertEqual(referenceDate.year, 1969)
        XCTAssertEqual(referenceDate.hour, 16)
        XCTAssertEqual(referenceDate.minute, 00)
        XCTAssertEqual(referenceDate.second, 00)
    }

    static var allTests : [(String, (PunctualTests) -> () throws -> Void)] {
        return [
            ("testDateProperties", testDateProperties),
        ]
    }
}
