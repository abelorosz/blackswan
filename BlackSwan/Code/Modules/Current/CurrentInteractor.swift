//
//  Created by Abel Orosz on 2016-09-22.
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
		Location.getLocation(accuracy: .city, frequency: .oneShot, success: { (_, location) -> (Void) in
			self.loadWeather(withLocation: location)
		}) { (_, location, _) -> (Void) in
			if let location = location {
				self.loadWeather(withLocation: location)
			}
		}
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
