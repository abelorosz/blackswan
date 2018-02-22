//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(type: T.Type) {
        let fullName = NSStringFromClass(type)
        let simpleName = fullName.components(separatedBy: ".").last! as String

        self.register(type, forCellReuseIdentifier: simpleName)
    }
    
    func registerCellNib<T: UITableViewCell>(type: T.Type) {
        let fullName = NSStringFromClass(type)
        let simpleName = fullName.components(separatedBy: ".").last! as String
        
        self.register(UINib(nibName: simpleName, bundle: nil), forCellReuseIdentifier: simpleName)
    }
    
    func dequeueCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let fullName = NSStringFromClass(type)
        let simpleName = fullName.components(separatedBy: ".").last! as String
        
        // swiftlint:disable force_cast
        return self.dequeueReusableCell(withIdentifier: simpleName, for: indexPath) as! T
    }
    
}
