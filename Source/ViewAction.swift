//
//  ViewAction.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit


struct ViewActionNotifications {
    static let ViewAction = "GridKitViewAction"
}


public class ViewAction {
    
    public let view: UIView
    public let key: String
    public let userInfo: [AnyHashable: Any]?
    
    public init(_ type: ViewContainerActionType, sender: UIView, userInfo: [AnyHashable: Any]? = nil) {
        self.key = type.key
        self.view = sender
        self.userInfo = userInfo
    }
    
    public func invoke() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: ViewActionNotifications.ViewAction), object: self, userInfo: userInfo)
    }
    
}
