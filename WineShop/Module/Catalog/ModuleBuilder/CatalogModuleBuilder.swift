import UIKit

enum CatalogModuleBuilder {
    static func build() -> UIViewController {
        let viewController = CatalogViewController()
        
        let router = CatalogRouter(viewController: viewController)
        let presenter = CatalogPresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
