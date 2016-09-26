//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import XCTest
@testable import BlackSwan

class WeatherTests: XCTestCase {
    
    let currentPresenter = CurrentPresenter()
    
    override func setUp() {
        super.setUp()
        
        currentPresenter.interface = self
    }
    
    func testConvertIDToString() {
        XCTAssertTrue("Snow" == currentPresenter.convertIDToString(id: "13n"))
        XCTAssertTrue("Clear sky" == currentPresenter.convertIDToString(id: "01d"))
        XCTAssertTrue("Thunderstorms" == currentPresenter.convertIDToString(id: "11d"))
        XCTAssertTrue("Thunderstorms" == currentPresenter.convertIDToString(id: "11n"))
    }
    
    func testConvertTimestampToString() {
        XCTAssertTrue("12:00" == currentPresenter.convertTimestampToString(time: 1474884000))
    }
    
    func testProcessCurrentWeather() {
        let weather = APICurrent()
        weather.city = "Budapest"
        weather.temperature = 300e0
        weather.weather = APIWeather()
        weather.weather.icon = "01d"
        
        currentPresenter.processResponse(currentWeather: weather)
    }
    
    func testProcessForecast() {
        let weather = APICurrent()
        weather.city = "Budapest"
        weather.time = 1474884000
        weather.temperature = 300e0
        weather.weather = APIWeather()
        weather.weather.icon = "01d"
        
        let forecast = APIForecast()
        forecast.list = [weather]
        
        currentPresenter.processResponse(forecastWeather: forecast)
    }
    
}

extension WeatherTests: CurrentPresenterOutput {
    
    func refreshCurrent(_ weather: Weather) {
        XCTAssertTrue("26°" == weather.temperature)
        XCTAssertTrue("Budapest" == weather.city)
    }
    
    func refreshForecast(_ forecast: [Weather]) {
        XCTAssertTrue("26°" == forecast.first!.temperature)
        XCTAssertTrue("12:00" == forecast.first!.time)
    }
    
}
