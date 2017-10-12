//
//  Configurable.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

public protocol Tagable {
    var tag: Int {get set}
}

public protocol Configurable: Tagable {
    associatedtype Model
    func configure(with _: Model)
}
