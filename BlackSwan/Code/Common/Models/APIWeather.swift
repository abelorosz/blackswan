//
//  Created by Abel Orosz on 2016-09-22.
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
