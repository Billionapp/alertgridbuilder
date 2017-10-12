//
//  imageSheetView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 30.08.17.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import Foundation

class ImageSheetView: LoadableFromXibView {
    
    struct Model {
        let image: UIImage
        let height: CGFloat?
        
        init(image: UIImage, height: CGFloat? = nil) {
            self.image = image
            self.height = height
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    
    override func xibSetup() {
        super.xibSetup()
        view.backgroundColor = .clear
    }
    
}

// MARK: - Configurable

extension ImageSheetView: Configurable {
    
    func configure(with model: Model) {
        imageView.image = model.image
        imageConstraint.constant = model.height ?? 140
    }
    
}
