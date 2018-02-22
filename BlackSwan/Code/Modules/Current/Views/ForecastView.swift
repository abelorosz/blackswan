//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class ForecastView: UIView {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    func setup(withModel model: Weather) {
        self.time.text = model.time
        self.icon.image = model.icon
        self.temperature.text = model.temperature
    }
    
}
