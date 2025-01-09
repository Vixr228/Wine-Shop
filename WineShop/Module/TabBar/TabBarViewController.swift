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
            initSingleViewController(
                viewController: MainPageModuleBuilder.build(),
                title: "Главная",
                image: R.image.homeIcon()),
            initSingleViewController(
                viewController: CatalogModuleBuilder.build(),
                title: "Каталог",
                image: R.image.catalogIcon()),
            initSingleViewController(
                viewController: BasketModuleBuilder.build(),
                title: "Корзина",
                image: R.image.basketIcon()),
            initSingleViewController(
                viewController: FavoriteModuleBuilder.build(),
                title: "Избранное",
                image: R.image.favoriteIcon()),
            initSingleViewController(
                viewController: ProfileModuleBuilder.build(),
                title: "Профиль",
                image: R.image.profileIcon()),
        ]
        makeBarStyle()
    }
    
    private func initSingleViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    func makeBarStyle(){
//        let posX: CGFloat = 10
//        let posY: CGFloat = 14
//        let width = tabBar.bounds.width - posX * 2
//        let height: CGFloat = tabBar.bounds.height + posY * 2
//
//        let layer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(
//            roundedRect: CGRect(
//                x: posX,
//                y: tabBar.bounds.minY - posY,
//                width: width,
//                height: height
//            ),
//            cornerRadius: height / 2)
//
//        layer.path = bezierPath.cgPath
//        tabBar.layer.insertSublayer(layer, at: 0)
        
        tabBar.itemWidth = tabBar.bounds.width / 5
        tabBar.itemPositioning = .centered
        tabBar.backgroundColor = R.color.footer()
        tabBar.barTintColor = R.color.footer()
        tabBar.tintColor = .white
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Font-Name", size: 10)!], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Font-Name", size: 10)!], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: R.font.montserratRegular(size: 12)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: R.font.montserratRegular(size: 12)!], for: .selected)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("kek")
        let tabBarHeight: CGFloat = 87
        
        tabBar.frame.size.height = tabBarHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight
    }
}
