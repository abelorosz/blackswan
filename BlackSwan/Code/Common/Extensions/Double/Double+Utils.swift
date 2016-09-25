//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

extension Double {
    
    func convertToTemperature(metric: Bool) -> Double {
        switch metric {
            case true: return self - 273.15
            case false: return self * 9 / 5 - 459.67
        }
    }
    
}
