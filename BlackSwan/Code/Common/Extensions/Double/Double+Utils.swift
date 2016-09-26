//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

extension Double {
    
    func convertToTemperature(metric: Bool) -> Double {
        switch metric {
            case true: return (self - 273.15).roundTo(places: 2)
            case false: return (self * 9 / 5 - 459.67).roundTo(places: 2)
        }
    }
    
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
