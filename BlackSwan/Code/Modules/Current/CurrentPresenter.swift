//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

protocol CurrentPresenterInput {
    func loadWeather()
}

protocol CurrentPresenterOutput: class {
    func refreshCurrent(_ weather: Weather)
    func refreshForecast(_ forecast: [Weather])
}

class CurrentPresenter: CurrentPresenterInput {
    
    var interactor: CurrentInteractorInput!
    weak var interface: CurrentPresenterOutput!
    
    func loadWeather() {
        self.interactor.loadWeather()
    }
    
}

extension CurrentPresenter: CurrentInteractorOutput {
    
    func processResponse(currentWeather weather: APICurrent?) {
        guard let weather = weather else {
            return
        }
        
        let currentWeather = Weather()
        currentWeather.city = weather.city
        currentWeather.icon = UIImage(named: weather.weather.icon)
        currentWeather.weather = self.convertIDToString(id: weather.weather.icon)
        currentWeather.temperature = "\(Int(floor(weather.temperature.convertToTemperature(metric: true))))°"
        
        self.interface.refreshCurrent(currentWeather)
    }
    
    func processResponse(forecastWeather forecast: APIForecast?) {
        guard let forecast = forecast else {
            return
        }
        
        var weatherArray = [Weather]()
        
        for weather in forecast.list {
            let fcst = Weather()
            fcst.icon = UIImage(named: weather.weather.icon + "_small")
            fcst.time = self.convertTimestampToString(time: Double(weather.time))
            fcst.temperature = "\(Int(floor(weather.temperature.convertToTemperature(metric: true))))°"
            
            weatherArray.append(fcst)
        }
        
        self.interface.refreshForecast(weatherArray)
    }
    
}

extension CurrentPresenter {
    
    func convertIDToString(id: String) -> String {
        switch id {
        case "01d", "01n": return "Clear sky"
        case "02d", "02n": return "Few clouds"
        case "03d", "03n": return "Scattered clouds"
        case "04d", "04n": return "Broken clouds"
        case "09d", "09n": return "Shower rain"
        case "10d", "10n": return "Rain"
        case "11d", "11n": return "Thunderstorms"
        case "13d", "13n": return "Snow"
        case "50d", "50n": return "Mist"
        default: return ""
        }
    }
    
    func convertTimestampToString(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = NSTimeZone.local
        
        return formatter.string(from: date)
    }
    
}
