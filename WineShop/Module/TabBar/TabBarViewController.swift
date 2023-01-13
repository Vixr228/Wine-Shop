//
//  TabBarViewController.swift
//  WineShop
//
//  Created by Kostyan on 13.01.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
    }
    
    func initTabBar(){
        print("initTabBar")
        viewControllers = [
            initSingleViewController(viewController: CatalogModule.build(), titile: "Каталог", image: UIImage(systemName: "house.fill")),
            initSingleViewController(viewController: MainPageModule.build(), titile: "Главная", image: UIImage(systemName: "house.fill"))
        ]
    }
    
    func initSingleViewController(viewController: UIViewController, titile: String, image: UIImage?) -> UIViewController {
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
