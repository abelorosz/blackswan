//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class Weather {
    
    var icon: UIImage!
    var city: String!
    var time: String!
    var weather: String!
    var temperature: String!
    
    convenience init(withTemperature temp: String) {
        self.init()
        
        self.temperature = temp
    }
    
}
