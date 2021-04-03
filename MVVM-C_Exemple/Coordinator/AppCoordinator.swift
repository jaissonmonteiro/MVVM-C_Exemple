//
//  AppCoordinator.swift
//  MVVM-C_Exemple
//
//  Created by Jaisson Monteiro on 01/04/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    private let navigationViewController = UINavigationController()
    private let window: UIWindow
    
    //MARK: - Inits
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Methods
    func start() {
        let coordinator = TodoListCoordinator(navigationViewController: navigationViewController)
        coordinator.start()
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
