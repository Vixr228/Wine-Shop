import UIKit

enum BasketModuleBuilder {
    static func build() -> UIViewController {
        let viewController = BasketViewController()
        
        let router = BasketRouter(viewController: viewController)
        let presenter = BasketPresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
