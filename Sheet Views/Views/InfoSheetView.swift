//
//  InfoSheetView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class InfoSheetView: SheetView {
    
    struct Model {
        let title: String
        let subtitle: String
    }

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    @IBAction func titlePressed(_ sender: UIButton) {
        ViewAction(.click, sender: self).invoke()
    }
    
    override func xibSetup() {
        super.xibSetup()
        let backgroundImage = UIImage(color: UIColor.white.withAlphaComponent(0.5))
        titleButton.setBackgroundImage(backgroundImage, for: .highlighted)
    }
}

// MARK: - ConfigureProtocol

extension InfoSheetView: Configurable {
    
    func configure(with model: Model) {
        titleButton.setTitle(model.title, for: .normal)
        subtitleLabel.text = model.subtitle
        heightConstraint.constant = BuilderDevice.screen.height
        
        // UITesting
        titleButton.accessibilityIdentifier = model.title
        subtitleLabel.accessibilityIdentifier = model.title + "subtitle"
    }
    
}
