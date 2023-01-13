import UIKit

enum MainPageModule {
    static func build() -> UIViewController {
        let viewController = MainPageViewController()
        
        let router = MainPageRouter(viewController: viewController)
        let presenter = MainPagePresenter(router: router)

        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
