//
//  AvatarSheetView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 14/09/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class AvatarSheetView: LoadableFromXibView {
        
    @IBOutlet weak var imageButton: UIButton!
    
    override func xibSetup() {
        super.xibSetup()
        view.backgroundColor = .clear
        
        imageButton.layer.cornerRadius = 15
        imageButton.layer.masksToBounds = true
        imageButton.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func avatarPressed(_ sender: UIButton) {
        ViewAction(.click, sender: self).invoke()
    }

}

// MARK: - Configurable

extension AvatarSheetView: Configurable {
    
    func configure(with model: UIImage?) {
        imageButton.setImage(model ?? UIImage(named: "Avatar"), for: .normal)
    }
    
}

