//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import CoreLocation
import ObjectMapper

class APIForecastWorker {
    
    func loadForecastWeather(withLocation location: CLLocation, completion: @escaping (APIForecast?) -> Void) {
        API.request(.forecast(location: location)) { (result) in
            switch result {
            case let .success(response):
                // swiftlint:disable force_try
                guard let forecast = Mapper<APIForecast>().map(JSONString: try! response.mapString()) else {
                    completion(nil)
                    return
                }
                
                guard let code = forecast.code, code == "200" else {
                    completion(nil)
                    return
                }
                
                completion(forecast)
                return
                
            case let .failure(error):
                print(error)
                
                completion(nil)
                return
            }
        }
    }
    
}
