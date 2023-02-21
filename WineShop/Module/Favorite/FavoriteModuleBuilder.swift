import UIKit

enum FavoriteModuleBuilder {
    static func build() -> UIViewController {
        let viewController = FavoriteViewController()
        
        let router = FavoriteRouter(viewController: viewController)
        let presenter = FavoritePresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
