//
//  ViewContainer.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit


public protocol ContainerConfigurable {
    func configure()
}


public protocol ContainerActionable {
    func invoke(_ action: ViewContainerActionType, userInfo: [AnyHashable: Any]?) -> Any?
}


public protocol Container: ContainerConfigurable, ContainerActionable {
    var view: UIView { get set }
}


public class ViewContainer<ViewType: UIView>: Container where ViewType: Configurable {
    
    public var view: UIView = ViewType()
    public var item: ViewType.Model
    public lazy var actions = [String: ViewContainerAction<ViewType>]()
    
    public init(item: ViewType.Model, actions: [ViewContainerAction<ViewType>]? = nil) {
        self.item = item
        actions?.forEach { self.actions[$0.type.key] = $0 }
    }
    
    // MARK: - ContainerConfigurable
    
    public func configure() {
        (view as! ViewType).configure(with: self.item)
    }
    
    
    // MARK: - ContainerActionable
    
    public func invoke(_ action: ViewContainerActionType, userInfo: [AnyHashable: Any]?) -> Any? {
        return actions[action.key]?.invoke(item: item, view: view as? ViewType, userInfo: userInfo)
    }
    
}
