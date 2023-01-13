protocol MainPageRoute {
    func openMainPageModule()
}

extension MainPageRoute where Self: RouterProtocol {
    
    func openMainPageModule() {
        let controller = MainPageModule.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
