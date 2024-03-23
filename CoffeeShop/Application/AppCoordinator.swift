//
//  AppCoordinator.swift
//  CoffeeShop
//
//  Created by Nihad Allahveranov on 23.03.24.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        // If onboarding is not completed, start the OnboardingVC
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
        let vc = hasCompletedOnboarding ? ViewController() : OnBoardingVC()
        
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: false)
    }

}
