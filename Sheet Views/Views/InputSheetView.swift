//
//  InputSheetView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 30/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class InputSheetView: LoadableFromXibView {
    
    typealias Info = (placeholder: String?, text: String?, editable: Bool)

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separatorView: UIView!

    @IBAction func valueChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        ViewAction(.change, sender: self, userInfo: ["text": text]).invoke()
    }
    
    @IBAction func didBeginEditing(_ sender: UITextField) {
        ViewAction(.begin, sender: self).invoke()
    }
    
    @IBAction func didEndEditing(_ sender: Any) {
        ViewAction(.end, sender: self).invoke()
    }
    
}

// MARK: - UITextFieldDelegate

extension InputSheetView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

// MARK: - Configurable

extension InputSheetView: Configurable {
    
    func configure(with info: Info) {
        textField.attributedPlaceholder = NSAttributedString(string: info.placeholder ?? "", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        textField.text = info.text
        textField.isUserInteractionEnabled = info.editable
        textField.textColor = info.editable ? UIColor.white : UIColor.white.withAlphaComponent(0.5)
    }
    
}
