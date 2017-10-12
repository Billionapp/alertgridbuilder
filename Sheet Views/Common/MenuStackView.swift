//
//  MenuStackView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 10/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class MenuStackView: LoadableFromXibView {
    
    enum Device {
        case seven
        case sevenPlus
        case five
        case four
        
        static var screen: Device {
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
            if width == 375 {
                return .seven
            } else if width == 414 {
                return .sevenPlus
            } else if height == 568 {
                return .five
            } else {
                return .four
            }
        }
        
        var offset: CGFloat {
            switch self {
            case .seven:
                return 16
            case .sevenPlus:
                return 20
            case .five, .four:
                return 10
            }
        }
        
        var spacing: CGFloat {
            switch self {
            case .seven:
                return 12
            case .sevenPlus:
                return 16
            case .five, .four:
                return 10
            }
        }
    }

    var bottomConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var keyboardHeight: CGFloat?

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bottomOffset: NSLayoutConstraint!
    @IBOutlet weak var leftOffset: NSLayoutConstraint!
    @IBOutlet weak var rightOffset: NSLayoutConstraint!
    
    init() {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func xibSetup() {
        super.xibSetup()
        
        [bottomOffset, leftOffset, rightOffset].forEach { $0?.constant = Device.screen.offset }
        
        stackView.spacing = Device.screen.spacing
        view.backgroundColor = .clear
        backgroundColor = .clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func hideStackView() {
        backgroundColor = .clear
        view.backgroundColor = .clear
        stackView.isHidden = true
    }
    
    func resize(in parentView: UIView) {
        let scrollViewHeight = stackView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + Device.screen.offset
        let constraints = attachToBottom(parentView, height: scrollViewHeight, bottomOffset: keyboardHeight ?? 0)
        bottomConstraint = constraints.0
        heightConstraint = constraints.1
        parentView.layoutIfNeeded()
    }
    
    func updateSize(in parentView: UIView) {
        let scrollViewHeight = stackView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + Device.screen.offset
        heightConstraint?.constant = scrollViewHeight
        bottomConstraint?.constant = -(keyboardHeight ?? 0)
        parentView.layoutIfNeeded()
    }
        
}

// MARK: - Keyboard

extension MenuStackView {
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo, let endFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            keyboardHeight = endFrame.size.height
            bottomConstraint?.constant = -endFrame.size.height
            superview?.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        keyboardHeight = nil
        bottomConstraint?.constant = 0
        superview?.layoutIfNeeded()
    }
    
}
