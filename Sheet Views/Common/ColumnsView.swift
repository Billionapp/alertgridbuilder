//
//  ColumnsView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class ColumnsView: LoadableFromXibView {
    
    typealias Info = (containers: [Container], distribution: UIStackViewDistribution)
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            dataManager = StackViewDataManager(stackView: stackView)
        }
    }
    fileprivate var dataManager: StackViewDataManager!

}

// MARK: - Configurable

extension ColumnsView: Configurable {
    
    func configure(with info: Info) {
        
        info.containers.forEach {
            $0.view.layer.cornerRadius = 20
            $0.view.layer.masksToBounds = true
        }
        
        dataManager.clear().append(containers: info.containers)
        stackView.distribution = info.distribution
    }
}

