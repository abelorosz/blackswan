//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import ObjectMapper

class APICurrent: Mappable {
    
    var code: Int?
    var time: Int!
    var city: String!
    var weather: APIWeather!
    var temperature: Double!

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        code <- map["cod"]
        time <- map["dt"]
        city <- map["name"]
        weather <- map["weather.0"]
        temperature <- map["main.temp"]
    }

}
