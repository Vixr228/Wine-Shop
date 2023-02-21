protocol AuthRoute {
    func openCatalogModule()
}

extension AuthRoute where Self: RouterProtocol {
    
    func openAuthModule() {
        let controller = AuthModuleBuilder.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
