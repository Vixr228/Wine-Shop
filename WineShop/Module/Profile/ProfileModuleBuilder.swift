import UIKit

enum ProfileModuleBuilder {
    static func build() -> UIViewController {
        let viewController = ProfileViewController()
        
        let router = ProfileRouter(viewController: viewController)
        let presenter = ProfilePresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
