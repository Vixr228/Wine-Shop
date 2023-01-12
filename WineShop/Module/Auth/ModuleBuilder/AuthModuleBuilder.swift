//
//  AuthModuleBuilder.swift
//  WineShop
//
//  Created by Kostyan on 10.01.2023.
//

import UIKit

enum AuthModuleBuilder {
    static func build() -> UIViewController {
        let viewController = AuthViewController()
        
        let router = AuthRouter(viewController: viewController)
        let presenter = AuthPresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}



