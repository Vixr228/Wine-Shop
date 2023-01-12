import UIKit

enum MainModuleBuilder {
    
    static func build() -> UIViewController {
        let viewController = MainViewController()
        
        let router = MainRouter(viewController: viewController)
        let presenter = MainPresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
