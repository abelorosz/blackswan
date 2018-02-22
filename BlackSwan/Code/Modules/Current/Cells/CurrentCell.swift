//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class CurrentCell: UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    func setup(withModel model: Weather) {
        self.city.text = model.city
        self.icon.image = model.icon
        self.weather.text = model.weather
        self.temperature.text = model.temperature
    }
    
}
