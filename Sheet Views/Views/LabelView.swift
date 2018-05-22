//
//  LabelView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 11/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class LabelView: LoadableFromXibView {
    
    struct Info {
        var text: String?
        var width: CGFloat?
        var height: CGFloat?
        
        var customize: ((UILabel, UIView) -> Void)?
        
        static func `default`(text: String) -> Info {
            return Info(text: text, width: nil, height: nil, customize: { label, view in
                view.backgroundColor = Theme.Color.gray
                view.layer.cornerRadius = 20
                view.layer.masksToBounds = true
            })
        }
        
        static func description(text: String) -> Info {
            return Info(text: text, width: nil, height: nil, customize: { label, view in
                label.font = label.font.withSize(12)
            })
        }
        
        static func mnemonic(text: String, width: CGFloat, height: CGFloat) -> Info {
            return Info(text: text, width: width, height: height, customize: { label, view in
                label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
                label.textAlignment = .center
                label.numberOfLines = 3
            })
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
}

// MARK: - Configurable

extension LabelView: Configurable {
    
    func configure(with info: Info) {
        label.text = info.text
        
        if let height = info.height {
            heightConstraint.constant = height
            heightConstraint.priority = UILayoutPriority(rawValue: 1000)
        }
        
        if let width = info.width {
            leftConstraint.isActive = false
            rightConstraint.isActive = false
            widthConstraint.constant = width
            widthConstraint.priority = UILayoutPriority(rawValue: 1000)
        }
        
        if let customize = info.customize {
            customize(label, self)
        }
    }
    
}
