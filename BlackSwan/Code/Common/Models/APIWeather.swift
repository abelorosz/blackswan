//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import ObjectMapper

class APIWeather: Mappable {

    var icon: String!

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        icon  <- map["icon"]
    }

}
