//
//  ButtonSheetView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class ButtonSheetView: SheetView {
    
    struct Model {
        var title: String
        var selected: Bool?
        
        var customizeTitleButton: ((UIButton) -> Void)?
        var customizeImageView: ((UIImageView) -> Void)?
        
        static func `default`(title: String) -> Model {
            return Model(title: title, selected: nil, customizeTitleButton: {
                $0.setTitleColor(.white, for: .normal)
            }, customizeImageView: nil)
        }
        
        static func destructive(title: String) -> Model {
            return Model(title: title, selected: nil, customizeTitleButton: {
                $0.setTitleColor(Theme.Color.red, for: .normal)
            }, customizeImageView: nil)
        }
        
        static func filetree(title: String) -> Model {
            return Model(title: title, selected: nil, customizeTitleButton: {
                $0.contentHorizontalAlignment = .left
            }, customizeImageView: {
                $0.isHidden = false
                $0.image = #imageLiteral(resourceName: "Arrow")
            })
        }
        
        static func selectable(title: String, selected: Bool) -> Model {
            return Model(title: title, selected: selected, customizeTitleButton: {
                $0.contentHorizontalAlignment = .left
            }, customizeImageView: {
                $0.isHidden = false
                $0.image = #imageLiteral(resourceName: "Check")
            })
        }
        
    }
    
    override func xibSetup() {
        super.xibSetup()
        titleButton.titleLabel?.textAlignment = .center
        titleButton.titleLabel?.lineBreakMode = .byCharWrapping
        
        let backgroundImage = UIImage(color: UIColor.white.withAlphaComponent(0.5))
        titleButton.setBackgroundImage(backgroundImage, for: .highlighted)
    }

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    // MARK: - Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        ViewAction(.click , sender: self).invoke()
    }

}

// MARK: - Configurable

extension ButtonSheetView: Configurable {
    
    func configure(with info: Model) {
        if let customizeTitleButton = info.customizeTitleButton {
            customizeTitleButton(titleButton)
        }
        
        if let customizeImageView = info.customizeImageView {
            customizeImageView(imageView)
        }
        
        titleButton.setTitle(info.title, for: .normal)
        
        heightConstraint.constant = BuilderDevice.screen.height
        
        if let selected = info.selected {
            imageView.isHidden = !selected
        }
        
        titleButton.accessibilityIdentifier = info.title
    }
    
} 
