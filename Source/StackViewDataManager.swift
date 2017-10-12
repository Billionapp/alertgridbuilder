//
//  StackViewDataManager.swift
//  ActionSheetManager
//
//  Created by Evolution Group Ltd on 07/08/2017.
//  Copyright © 2017 Evolution Group Ltd. All rights reserved.
//

import UIKit

public class StackViewDataManager {
    
    let stackView: UIStackView
    var containers = [Container]()
    
    public init(stackView: UIStackView) {
        self.stackView = stackView
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveAction), name: NSNotification.Name(rawValue: ViewActionNotifications.ViewAction), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func didReceiveAction(_ notification: Notification) {
        guard let action = notification.object as? ViewAction else {
            return
        }
        
        for container in containers {
            if container.view == action.view {
                let _ = container.invoke(.custom(action.key), userInfo: notification.userInfo)
            }
        }
    }
    
    @discardableResult
    public func append(container: Container) -> Self {
        containers.append(container)
        container.configure()
        stackView.addArrangedSubview(container.view)
        return self
    }
    
    @discardableResult
    public func append(containers: [Container]) -> Self {
        for (i, container) in containers.enumerated() {
            container.view.tag = i
            append(container: container)
        }
        return self
    }
    
    @discardableResult
    public func updateSection(at index: Int, with item: [Container]) -> Self {
        if let viewContainer = containers[index] as? ViewContainer<SectionView> {
            viewContainer.item = item
            UIView.setAnimationsEnabled(false)
            viewContainer.configure()
            UIView.setAnimationsEnabled(true)
        }
        return self
    }
    
    @discardableResult
    public func clear() -> Self {
        containers.removeAll()
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        return self
    }
    
}
