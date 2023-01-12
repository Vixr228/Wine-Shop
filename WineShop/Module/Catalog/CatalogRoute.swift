protocol CatalogRoute {
    func openCatalogModule()
}

extension CatalogRoute where Self: RouterProtocol {
    
    func openCatalogModule() {
        let controller = CatalogModule.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
