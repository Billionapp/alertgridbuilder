//
//  TitledView.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 29/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class TitledView: LoadableFromXibView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    var closePressed: (() -> Void)? {
        didSet {
            closeButton.isHidden = closePressed == nil
        }
    }
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    init() {
        let y: CGFloat = BuilderDevice.isIPhoneX ? 8 : 0
        super.init(frame: CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: 100))
        
        if BuilderDevice.isIphoneSE {
            let font = titleLabel.font!
            titleLabel.font = UIFont(name: font.fontName, size: font.lineHeight - 10)
            let subtitleFont = subtitleLabel.font!
            subtitleLabel.font = UIFont(name: subtitleFont.fontName, size: subtitleFont.lineHeight - 3)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        closePressed?()
    }

}
