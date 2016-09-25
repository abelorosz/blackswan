//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import CoreLocation
import ObjectMapper

class APICurrentWorker {
    
    func loadCurrentWeather(withLocation location: CLLocation, completion: @escaping (APICurrent?) -> Void) {
        API.request(.current(location: location)) {
            (result) in
            
            switch result {
                case let .success(response):
                    // swiftlint:disable force_try
                    guard let weather = Mapper<APICurrent>().map(JSONString: try! response.mapString()) else {
                        completion(nil)
                        return
                    }
                    
                    guard let code = weather.code, code == 200 else {
                        completion(nil)
                        return
                    }
                    
                    completion(weather)
                    return
                
                case let .failure(error):
                    print(error)
                
                    completion(nil)
                    return
            }
        }
    }
    
}
