//
//  LoadableFromXibView.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

class LoadableFromXibView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromXib()
        addSubview(view)
        addFillerSubview(view)
    }
    
    private func loadViewFromXib() -> UIView {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
}

extension UIView {
    func addFillerSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)

        addfillerConstraints(subview)
    }
    
    func attachToBottom(_ parentView: UIView, height: CGFloat, bottomOffset: CGFloat = 0) -> (NSLayoutConstraint, NSLayoutConstraint) {
        translatesAutoresizingMaskIntoConstraints = false
        let left = leftAnchor.constraint(equalTo: parentView.leftAnchor)
        let right = rightAnchor.constraint(equalTo: parentView.rightAnchor)
        let height = heightAnchor.constraint(equalToConstant: height)
        let bottomConstraint = bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -bottomOffset)
        NSLayoutConstraint.activate([left, right, height, bottomConstraint])
        return (bottomConstraint, height)
    }
    
    func addfillerConstraints(_ subview: UIView) {
        let left = subview.leftAnchor.constraint(equalTo: leftAnchor)
        let right = subview.rightAnchor.constraint(equalTo: rightAnchor)
        let top = subview.topAnchor.constraint(equalTo: topAnchor)
        let bottom = subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([left, right, top, bottom])
    }
}

