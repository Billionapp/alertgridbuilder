//
//  SheetView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class SheetView: LoadableFromXibView {
    
    func customizations() {
        addSeparator()
    }
    
    override func xibSetup() {
        super.xibSetup()
        customizations()
    }
    
    func addSeparator() {
        let separator = UIView()
        separator.backgroundColor = Theme.Color.separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separator)
        
        let height = separator.heightAnchor.constraint(equalToConstant: 0.5)
        let left = separator.leftAnchor.constraint(equalTo: leftAnchor)
        let right = separator.rightAnchor.constraint(equalTo: rightAnchor)
        let bottom = separator.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([height, left, right, bottom])
    }
    
}
