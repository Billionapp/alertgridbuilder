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
        
        var customize: ((UILabel, UIView) -> Void)?
        
        static func `default`(text: String) -> Info {
            return Info(text: text, width: nil, customize: { label, view in
                view.backgroundColor = Theme.Color.gray
                view.layer.cornerRadius = 20
                view.layer.masksToBounds = true
            })
        }
        
        static func description(text: String) -> Info {
            return Info(text: text, width: nil, customize: { label, view in
                label.font = label.font.withSize(12)
            })
        }
        
        static func defails(text: String, width: CGFloat) -> Info {
            return Info(text: text, width: width, customize: { label, view in
                label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
                label.textAlignment = .right
                label.numberOfLines = 0
            })
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
}

// MARK: - Configurable

extension LabelView: Configurable {
    
    func configure(with info: Info) {
        label.text = info.text
        
        if let width = info.width {
            widthConstraint.constant = width
            widthConstraint.priority = UILayoutPriority(rawValue: 1000)
        }
        
        if let customize = info.customize {
            customize(label, self)
        }
    }
    
}
