//
//  SwitchSheetView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 10/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class SwitchSheetView: SheetView {
    
    typealias Info = (title: String, isOn: Bool)

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var switchControl: UISwitch!
    
    @IBAction func titleButtonPressed(_ sender: UIButton) {
        ViewAction(.click, sender: self).invoke()
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        ViewAction(.switch, sender: self, userInfo: ["isOn": sender.isOn]).invoke()
    }
}

// MARK: - SwitchSheetView

extension SwitchSheetView: Configurable {
    
    func configure(with info: Info) {
        titleButton.setTitle(info.title, for: .normal)
        switchControl.isOn = info.isOn
    }
    
}
