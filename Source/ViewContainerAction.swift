//
//  ViewContainerAction.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit


public enum ViewContainerActionType {
    
    case custom(String)
    case click
    case select
    case `switch`
    case `return`
    case change
    case begin
    case end
    
    
    var key: String {
        switch (self) {
        case .custom(let key):
            return key
        default:
            return "_\(self)"
        }
    }
    
}


public class ViewContainerActionData<ViewType: Configurable> {
    public let item: ViewType.Model
    public let view: ViewType?
    public let userInfo: [AnyHashable: Any]?
    
    public var index: Int? {
        return view?.tag
    }
    
    init(item: ViewType.Model, view: ViewType?, userInfo: [AnyHashable: Any]?) {
        self.item = item
        self.view = view
        self.userInfo = userInfo
    }
}


public class ViewContainerAction<ViewType: Configurable> {
    
    public let type: ViewContainerActionType
    fileprivate let handler: ((_ data: ViewContainerActionData<ViewType>) -> Any?)
    
    public init<T>(_ type: ViewContainerActionType, handler: @escaping (_ data: ViewContainerActionData<ViewType>) -> T) {
        self.type = type
        self.handler = handler
    }
    
    func invoke(item: ViewType.Model, view: ViewType?, userInfo: [AnyHashable: Any]?) -> Any? {
        return handler(ViewContainerActionData(item: item, view: view, userInfo: userInfo))
    }
    
}
