//
//  TextFieldSheetView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 15/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class TextFieldSheetView: SheetView {
    
    struct Info {
        var placeholder: String?
        var value: String?
        
        var customize: ((UITextView, UILabel, UIView, UIView) -> Void)?
        
        static func `default`(placeholder: String?, value: String? = nil) -> Info {
            return Info(placeholder: placeholder, value: value, customize: nil)
        }
        
        static func blank(placeholder: String?, value: String? = nil) -> Info {
            return Info(placeholder: placeholder, value: value, customize: { textView, placeholder, separatorView, view in
                textView.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
                placeholder.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
                separatorView.isHidden = false
                view.backgroundColor = .clear
            })
        }
    }
    
    var placeholderLabel : UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    override func xibSetup() {
        super.xibSetup()
        textView.delegate = self
        textView.textContainerInset = UIEdgeInsets(top: 7, left: 20, bottom: 7, right: 42)
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = textView.font
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin.x = 25
        placeholderLabel.frame.origin.y = 7
        placeholderLabel.frame.size.width = 200
        textView.addSubview(placeholderLabel)
        placeholderLabel.textColor = textView.textColor?.withAlphaComponent(0.5)
        placeholderLabel.isHidden = !textView.text.isEmpty
        textView.becomeFirstResponder()
    }

}

// MARK: - UITextViewDelegate

extension TextFieldSheetView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        
        let size = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: .greatestFiniteMagnitude))
        if size.height != textViewHeightConstraint.constant && size.height > textView.frame.size.height {
            textViewHeightConstraint.constant = size.height
            textView.setContentOffset(.zero, animated: false)
        }
        ViewAction(.change, sender: self, userInfo: ["text": textView.text]).invoke()
    }
    
}

// MARK: - Configurable

extension TextFieldSheetView: Configurable {
    
    func configure(with info: Info) {
        placeholderLabel.text = info.placeholder
        textView.text = info.value
        info.customize?(textView, placeholderLabel, separatorView, self.view)        
    }
    
}
