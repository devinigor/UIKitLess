// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Отвечает за отображение сцен
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        var viewController = RegistrationController()
        var navi = UINavigationController()
        navi.viewControllers = [viewController]
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
    }
}
