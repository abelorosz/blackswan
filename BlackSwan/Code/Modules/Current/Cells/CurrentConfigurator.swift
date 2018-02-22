//
//  Created by Abel Orosz
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import UIKit

class CurrentConfigurator {
    
    // MARK: Object lifecycle
    
    static let sharedInstance = CurrentConfigurator()
    
    // MARK: Configuration
    
    func configure(withViewController viewController: CurrentViewController) {
        let presenter   = CurrentPresenter()
        let interactor  = CurrentInteractor()
        
        // presenter <-> interactor
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        // presenter <-> interface
        presenter.interface = viewController
        viewController.presenter = presenter
    }
    
}
