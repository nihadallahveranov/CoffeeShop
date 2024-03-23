//
//  Coordinator.swift
//  CoffeeShop
//
//  Created by Nihad Allahveranov on 23.03.24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)

    func start()
}
