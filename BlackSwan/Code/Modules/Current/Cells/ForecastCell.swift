//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func setup(withModels models: [Weather]) {
        self.scrollView.contentSize = CGSize(width: (models.count > 8 ? 8 : models.count) * 70 - 1, height: 80)
        
        for (index, weather) in models.enumerated() {
            if index > 7 {
                break
            }
            
            let forecast = UIView.fromNib(type: ForecastView.self)
            forecast.frame = CGRect(x: index * 70, y: 0, width: 70, height: 80)
            forecast.setup(withModel: weather)
            
            self.scrollView.addSubview(forecast)
        }
    }
    
}
