//
//  SheetView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 08/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class SheetView: LoadableFromXibView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizations()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func customizations() {
        view.backgroundColor = Theme.Color.gray
        addSeparator()
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
