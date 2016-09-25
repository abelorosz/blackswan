//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit
import ObjectMapper

class APIForecast: Mappable {
    
    var code: String?
    var list: [APICurrent]!
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code <- map["cod"]
        list <- map["list"]
    }
    
}
