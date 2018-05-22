//
//  BuilderDevice.swift
//  BillionWallet
//
//  Created by Evolution Group Ltd on 29/11/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

enum BuilderDevice {
    case seven
    case sevenPlus
    case five
    case four
    
    static var isIPhoneX: Bool {
        let height = UIScreen.main.bounds.size.height
        return height == 812
    }
    
    static var isIphoneSE: Bool {
        let height = UIScreen.main.bounds.size.height
        return height == 568
    }
    
    static var screen: BuilderDevice {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        if width == 375 {
            return .seven
        } else if width == 414 {
            return .sevenPlus
        } else if height == 568 {
            return .five
        } else {
            return .four
        }
    }
    
    var offset: CGFloat {
        switch self {
        case .seven:
            return 16
        case .sevenPlus:
            return 20
        case .five, .four:
            return 10
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .seven:
            return 12
        case .sevenPlus:
            return 16
        case .five, .four:
            return 10
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .seven:
            return 20
        case .sevenPlus:
            return 20
        case .five, .four:
            return 16
        }
    }
    
    var height: CGFloat {
        switch self {
        case .seven:
            return 59
        case .sevenPlus:
            return 62
        case .five, .four:
            return 52
        }
    }
    
    var contactCellHeight: CGFloat {
        switch self {
        case .seven:
            return 71
        case .sevenPlus:
            return 78
        case .five, .four:
            return 63
        }
    }
}
