//
//  SectionView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class SectionView: LoadableFromXibView {
    
    @IBOutlet weak var stackView: UIStackView!
    fileprivate var dataManager: StackViewDataManager!
    
    var gradientLayer: CALayer?
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.gradientLayer?.frame = self.bounds
    }
    
    override func xibSetup() {
        super.xibSetup()
        dataManager = StackViewDataManager(stackView: stackView)
        viewCustomizations()
        setupGradient()
    }
    
    func viewCustomizations() {
        layer.cornerRadius = BuilderDevice.screen.cornerRadius
        layer.masksToBounds = true
    }
    
    fileprivate func setupGradient() {
        backgroundColor = .clear
        let colorLeft = Color.buttonTop
        let colorRight = Color.buttonBottom
        gradientLayer = applyGradient([colorLeft, colorRight], locations: [0, 1])
        layer.insertSublayer(gradientLayer!, at: 0)
    }
}

// MARK: - Configurable

extension SectionView: Configurable {
    
    func configure(with containers: [Container]) {
        dataManager.clear().append(containers: containers)
    }
    
}
