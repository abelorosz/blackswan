//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import XCTest
@testable import BlackSwan

class ExtensionsTests: XCTestCase {
    
    func testCelsiusConversion() {
        let kelvin: Double = 300e0
        let celsius = kelvin.convertToTemperature(metric: true)
        
        XCTAssertTrue(celsius == 26.85)
    }
    
    func testFahrenheitConversion() {
        let kelvin: Double = 300e0
        let fahrenheit = kelvin.convertToTemperature(metric: false)
        
        XCTAssertTrue(fahrenheit == 80.33)
    }
    
}
