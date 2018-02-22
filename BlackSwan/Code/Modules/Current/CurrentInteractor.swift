//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftLocation

protocol CurrentInteractorInput {
    func loadWeather()
}

protocol CurrentInteractorOutput: class {
    func processResponse(currentWeather weather: APICurrent?)
    func processResponse(forecastWeather forecast: APIForecast?)
}

class CurrentInteractor: CurrentInteractorInput {
    
    weak var presenter: CurrentInteractorOutput!
    
    func loadWeather() {
        Locator.currentPosition(accuracy: .city, onSuccess: { (location) in
            self.loadWeather(withLocation: location)
        }, onFail: { (_, location) in
            if let location = location {
                self.loadWeather(withLocation: location)
            }
        })
    }
    
}

private extension CurrentInteractor {
    
    func loadWeather(withLocation location: CLLocation) {
        let currentWorker = APICurrentWorker()
        let forecastWorker = APIForecastWorker()
        
        currentWorker.loadCurrentWeather(withLocation: location) { (weather) in
            self.presenter.processResponse(currentWeather: weather)
        }
        
        forecastWorker.loadForecastWeather(withLocation: location) { (forecast) in
            self.presenter.processResponse(forecastWeather: forecast)
        }
    }
    
}
