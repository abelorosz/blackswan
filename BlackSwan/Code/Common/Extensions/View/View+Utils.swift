//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

extension UIView {
    
    class func fromNib<T: UIView>(type: T.Type) -> T {
        // swiftlint:disable force_cast
        return Bundle.main.loadNibNamed(String(describing: type), owner: nil, options: nil)!.first as! T
    }
    
}
