//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by enTrust Title on 2024-05-13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // Tree App
//        let treeVC = TreeViewController()
//        window?.rootViewController = treeVC
        
        //Menu App
//        let menuVC = UINavigationController(rootViewController: MenuViewController())
//        window?.rootViewController = menuVC
        
        // Drawing App
        
        let drawingViewController = UINavigationController(rootViewController: DrawingViewController())
        window?.rootViewController = drawingViewController
        
        // Daily needs app
        
//        let categoryViewController = UINavigationController(rootViewController: CategoryViewController())
//        window?.rootViewController = categoryViewController
        
        // life cycle app
        
//        let lifeCycleVC = UINavigationController(rootViewController:LifeCycleViewController())
//        window?.rootViewController = lifeCycleVC
        
        //auto constraint app
        
//        window?.rootViewController = StackAutoViewController()
        
        // Normal Application
        
//        window?.rootViewController = NormalViewController()
        
        //To Text Field Test App
        
//        window?.rootViewController = ExpandTextFieldViewController()
        
        //Collection View APp
        
//        window?.rootViewController = CollectionViewController()
        
        //Text testing app
        
//        window?.rootViewController = ToViewController()
        
        //Date picker app
        
//        window?.rootViewController = DatePickerViewController()
        
        // Menu App
        
//        let menuVC = UINavigationController(rootViewController:MenuViewController())
//        window?.rootViewController = menuVC
        
        // Email App
        
//        let emailVC = UINavigationController(rootViewController:EmailViewController())
//        window?.rootViewController = emailVC
        
        // Nested Tab Application
//        let primaryVC = NTPrimaryViewController()
//        let secodaryVC = NTSecondaryViewController()
//        
//        let primaryNavVC = UINavigationController(rootViewController:primaryVC)
//        let secondaryNavVC = UINavigationController(rootViewController:secodaryVC)
//        
//        let tabBarItemPrimary = UITabBarItem(title: "Primary", image: UIImage(systemName: "house"),
//                                             selectedImage: UIImage(systemName: "house.fill"))
//        let tabBarItemSecondary = UITabBarItem(title: "Secondary", image: UIImage(systemName: "sink"),
//                                               selectedImage: UIImage(systemName: "sink.fill"))
//                                               
//        primaryNavVC.tabBarItem = tabBarItemPrimary
//        secondaryNavVC.tabBarItem = tabBarItemSecondary
//                                
//        let tabController = UITabBarController()
//        tabController.viewControllers = [primaryNavVC, secondaryNavVC]
//        window?.rootViewController = tabController
        
        
        // UIStackView Application
//        let ctVC = ContextPrimaryVC()
//        window?.rootViewController = UINavigationController(rootViewController: ctVC)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

