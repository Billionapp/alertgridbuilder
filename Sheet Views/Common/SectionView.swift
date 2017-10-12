//
//  SectionView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class SectionView: LoadableFromXibView {
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            dataManager = StackViewDataManager(stackView: stackView)
            viewCustomizations()
        }
    }
    fileprivate var dataManager: StackViewDataManager!
    
    func viewCustomizations() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}

// MARK: - Configurable

extension SectionView: Configurable {
    
    func configure(with containers: [Container]) {
        dataManager.clear().append(containers: containers)
    }
    
}
